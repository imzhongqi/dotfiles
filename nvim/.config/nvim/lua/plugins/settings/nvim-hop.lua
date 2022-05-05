-- https://github.com/phaazon/hop.nvim/blob/master/plugin/hop.vim

local status_ok, hop = pcall(require, "hop")
if not status_ok then
    return
end

hop.setup({
    keys = "etovxqpdygfblzhckisuran",
    jump_on_sole_occurrence = false,
})
