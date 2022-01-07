----------------------------------------------------------------------------------------------------------------------
--
--                             ░█████╗░██╗░░░██╗████████╗░█████╗░
--                             ██╔══██╗██║░░░██║╚══██╔══╝██╔══██╗
--                             ███████║██║░░░██║░░░██║░░░██║░░██║
--                             ██╔══██║██║░░░██║░░░██║░░░██║░░██║
--                             ██║░░██║╚██████╔╝░░░██║░░░╚█████╔╝
--                             ╚═╝░░╚═╝░╚═════╝░░░░╚═╝░░░░╚════╝░
--
--       ░█████╗░░█████╗░███╗░░░███╗██████╗░██╗░░░░░███████╗████████╗██╗░█████╗░███╗░░██╗░██████╗
--       ██╔══██╗██╔══██╗████╗░████║██╔══██╗██║░░░░░██╔════╝╚══██╔══╝██║██╔══██╗████╗░██║██╔════╝
--       ██║░░╚═╝██║░░██║██╔████╔██║██████╔╝██║░░░░░█████╗░░░░░██║░░░██║██║░░██║██╔██╗██║╚█████╗░
--       ██║░░██╗██║░░██║██║╚██╔╝██║██╔═══╝░██║░░░░░██╔══╝░░░░░██║░░░██║██║░░██║██║╚████║░╚═══██╗
--       ╚█████╔╝╚█████╔╝██║░╚═╝░██║██║░░░░░███████╗███████╗░░░██║░░░██║╚█████╔╝██║░╚███║██████╔╝
--       ░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚═╝░░░░░╚══════╝╚══════╝░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝╚═════╝░
-- [Notice] The CMP only requests a lua-file to be associated with the lsp kind icons,  which is lspkind_icons.lua
-- Check for more details:  https://github.com/LunarVim/Neovim-from-scratch/blob/05-completion/lua/user/cmp.lua
----------------------------------------------------------------------------------------------------------------------
local present, cmp = pcall(require, "cmp")

if not present then return end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then return end

require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
    local col = vim.fn.col(".") - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

vim.opt.completeopt = "menuone,noselect"

-- nvim-cmp setup
cmp.setup({
    snippet = {
        expand = function(args) require("luasnip").lsp_expand(args.body) end
    },

    documentation = {
        border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}
    },
    formatting = {
        fields = {"kind", "abbr", "menu"},
        format = function(entry, vim_item)
            -- load lspkind icons
            vim_item.kind = string.format("%s %s", require(
                                              "plugins.configs.lspkind_icons").icons[vim_item.kind], -- Icons for the language server, should be loaded here
                                          vim_item.kind)

            vim_item.menu = ({
                -- nvim_lsp = "[LSP]",
                nvim_lsp = "[曆 LSP]",
                nvim_lua = "[  Lua]",
                buffer = "[﬘  BUF]",
                ultisnips = "[   UltiSnips]",
                cmp_tabnine = "[  TabNine]",
                look = "[Look]",
                path = "[  Path]",
                spell = "[暈 Spell]",
                calc = "[  Calc]",
                emoji = "[ﲃ  Emoji]"
            })[entry.source.name]

            return vim_item
        end
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        }),
        --      ["<Tab>"] = function(fallback)
        --         if vim.fn.pumvisible() == 1 then
        --            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n")
        --         elseif require("luasnip").expand_or_jumpable() then
        --            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
        --         else
        --            fallback()
        --         end
        --      end,
        --      ["<S-Tab>"] = function(fallback)
        --         if vim.fn.pumvisible() == 1 then
        --            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, true, true), "n")
        --         elseif require("luasnip").jumpable(-1) then
        --            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
        --         else
        --            fallback()
        --         end
        --      end,
        -- TAB Configuration with the CMP
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif check_backspace() then
                fallback()
            else
                fallback()
            end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {"i", "s"})

        --		["<Tab>"] = cmp.mapping(function(fallback)
        --			if cmp.visible() then
        --				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        --			else
        --        fallback()
        --			end
        --		end, {
        --			"i",
        --			"s",
        --		}),
        --		["<S-Tab>"] = cmp.mapping(function(fallback)
        --			if cmp.visible() then
        --				cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
        --			else
        --				fallback()
        --			end
        --		end, {
        --			"i",
        --			"s",
        --		}),
    },
    sources = {
        {
            name = "nvim_lsp"
        }, {
            name = "luasnip"
        }, {
            name = "buffer"
        }, {
            name = "nvim_lua"
        }, {
            name = "buffer"
        }, {
            name = "nvim_lsp"
        }, {
            name = "ultisnips"
        }, {
            name = "nvim_lua"
        }, {
            name = "look"
        }, {
            name = "path"
        }, {
            name = "cmp_tabnine"
        }, {
            name = "calc"
        }, {
            name = "spell"
        }, {
            name = "emoji"
        }
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false
    },
    completion = {
        completeopt = "menu,menuone,noinsert"
    },
    experimental = {
        ghost_text = false,
        native_menu = false
    }
})

-- ======================= More configurations for cmp ==========================
-- Autopairs
-- require("nvim-autopairs.completion.cmp").setup({
--     map_cr = true,
--     map_complete = true,
--     auto_select = true
-- })

-- TabNine

-- require'cmp'.setup {
--  sources = {
--  	{ name = 'cmp_tabnine' },
-- 	{max_lines = 1000, max_num_results = 20, sort = true}
--  },
-- }

-- local lspkind = require('lspkind')
-- local source_mapping = {
-- 	buffer = "[Buffer]",
-- 	nvim_lsp = "[LSP]",
-- 	nvim_lua = "[Lua]",
-- 	cmp_tabnine = "[TN]",
-- 	path = "[Path]",
-- }

-- require'cmp'.setup {
-- 	sources = {
-- 		{ name = 'cmp_tabnine' },
-- 	},
-- 	formatting = {
-- 		format = function(entry, vim_item)
-- 			vim_item.kind = lspkind.presets.default[vim_item.kind]
-- 			local menu = source_mapping[entry.source.name]
-- 			if entry.source.name == 'cmp_tabnine' then
-- 				if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
-- 					menu = entry.completion_item.data.detail .. ' ' .. menu
-- 				end
-- 				vim_item.kind = ''
-- 			end
-- 			vim_item.menu = menu
-- 			return vim_item
-- 		end
-- 	},
-- }

-- Database completion
vim.api.nvim_exec([[
autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })
]], false)
