local api = vim.api

local glow_width = vim.g.glow_width

local function has_value(tab, val)
    for _, value in ipairs(tab) do if value == val then return true end end
    return false
end

local M = {}

local function validate(path)
    -- TODO: download glow if bin not found

    -- trim and get the full path
    path = string.gsub(path, "%s+", "")
    path = string.gsub(path, "\"", "")
    -- FIXME: path cannot equal "" or "%" at the same time
    path = path == "" and "%" or path
    path = vim.fn.expand(path)
    path = vim.fn.fnamemodify(path, ":p")

    -- check if file exists
    local file_exists = vim.fn.filereadable(path) == 1
    if not file_exists then
        api.nvim_err_writeln("file does not exists")
        return
    end

    -- check if file extension if validate markdown or not
    local ext = vim.fn.fnamemodify(path, ":e")
    if not has_value({
        "md", "markdown", "mkd", "mkdn", "mdwn", "mdtxt", "mdtext"
    }, ext) then
        api.nvim_err_writeln("glow only support markdown file")
        return
    end

    return path
end

local function open_window(path)
    -- calculate the size of splitted buffer
    local cursor_position = api.nvim_win_get_cursor(0);
    local line = cursor_position[1];
    local column = cursor_position[2];

    -- set minimum window width if user already set
    -- if glow_width and glow_width < win_width then glow_width = win_width end

    local editor_winid = vim.fn.win_getid();

    vim.cmd("vnew")
    local preview_winid = vim.fn.win_getid();

    local buf = api.nvim_create_buf(false, true)
    api.nvim_buf_set_option(buf, "bufhidden", "wipe")
    api.nvim_buf_set_option(buf, "filetype", "glowpreview")
    -- TODO: set buffer callback function via `nvim_buf_attach.on_changedtick` from editor
    api.nvim_win_set_buf(preview_winid, buf);

    vim.fn.termopen(string.format("%s %s", "/usr/bin/glow",
                                  vim.fn.shellescape(path)));
    -- skip preview to the target position
    api.nvim_win_set_cursor(preview_winid, {line, column}); -- FIXME: error: cursor position out of buffer

    -- return to the editor window
    vim.api.nvim_set_current_win(editor_winid);
end

function M.glow(file)
    local path = validate(file)
    if path == nil then
        -- display error log
        return
    end
    open_window(path)
end

return M
