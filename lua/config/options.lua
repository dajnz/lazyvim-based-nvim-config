-------------------------
-- Base NeoVim settings
-----------------------

-- Getting config object for convenience
local o = vim.opt
local ol = vim.opt_local

---------
-- Cursor
---------

o.guicursor = "n-v-c-sm-i-ci-ve:block,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"

---------
-- Indentation
---------

-- Always use spaces rather than tabs by default
-- This can be overridden inside .editorconfig for separate project or inside after/ftplugin/*.lua
o.expandtab = true
-- Number of spaces that a <Tab> in the file counts for.
o.tabstop = 4
-- Number of spaces to use for each step of (auto)indent.
o.shiftwidth = 4

---------
-- Lines wrapping
---------

-- Wrapping for long lines by default
o.wrap = true
-- Nice soft-wrapping for long lines with respect of starting indentation
o.breakindent = true
-- Wrapping should be done by whole words
o.linebreak = true
-- Shows some indication for soft-wrapped lines
o.showbreak = "⪫⪫⪫ "

---------
-- Whitespace characters showing
---------

-- What characters used for specific types of whitespaces indication
o.listchars = {
    -- Leading spaces, showing when a line has any
    lead = "·",
    -- Trailing spaces, showing when a line has any
    trail = "·",
    -- Showing two or more consecutive space characters within text
    multispace = "··",
    -- Non-breakable spaces
    nbsp = "␣",
    -- Tabs
    tab = "  →",
}
-- Enables whitespaces showing mode
o.list = true

---------
-- Spellchecking settings
---------

-- Built-in spell checking for EN and RU
o.spell = true
o.spelllang = { "ru_yo", "en_us" }
-- Disable spellchecking rule for capital letter at the beginning of a sentence
o.spellcapcheck = ""
ol.spellcapcheck = ""
