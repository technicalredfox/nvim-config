-- path where lazy will clone plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- check to see if lazy itself is cloned, if not clone it into the lazy.nvim directory
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath
    })
end

-- add path to the lazy plugin repositories to the vim runtime path
vim.opt.rtp:prepend(lazypath)

-- declare options for lazy
local opts = {
    change_detection = {
        -- don't notify everytime a change is made to the configuration
        notify = false
    },
    checker = {
        -- automatically check for package updates
        enabled =  true,
        -- don't spam with notifications when an update is available
        notify = false
    }
}

-- load options
require("config.options")
-- load keymaps
require("config.keymaps")
-- load the auto commands from the config/autocmds.lua file
require("config.autocmds")

-- setup lazy, this should always be at last
-- tell lazy that all plugin specs are found in the plugins directory
-- pass the options specified above
require("lazy").setup("plugins", opts)


