local wk = require('which-key')

-- Miscelaneous small quality of life stuff
wk.register({
  H = { "<cmd>tabp<cr>", "Previous tab" },
  L = { "<cmd>tabn<cr>", "Next tab" },
  ["<C-Up>"] = {"<cmd>resize -1<cr>", "Continuous window vertical resize" },
  ["<C-Down>"] = {"<cmd>resize +1<cr>", "Continuous window vertical resize" },
  ["<C-Left>"] = {"<cmd>vertical resize +1<cr>", "Continuous window horizontal resize" },
  ["<C-Right>"] = {"<cmd>vertical resize -1<cr>", "Continuous window horizontal resize" },
  ['<leader>lw'] = {"<cmd>set wrap!<cr>", "Toggle wrap" },
  ["<C-s><C-s>" ] = {"<cmd>w<cr>", "Save buffer"},
  ["gf"] = {"<cmd>e <cfile><cr>", "Open file under cursor even if not existing"},
})

-- Fugitive, git stuff
wk.register({
  ['<leader>'] = {
    g = {
      name = "Fugitive",
      s = {"<cmd>Git<cr>", "Git status half screen" },
      S = {"<cmd>Gtabedit :<cr>", "Git status new tab" },
      a = {"<cmd>Git add %:p<cr>", "Git add file" },
      c = {"<cmd>Git commit<cr>", "Git commit" },
      t = {"<cmd>Gitsigns toggle_signs<cr>", "Toggle gitsigns" },
      r = {"<cmd>Gread<cr>", "Revert to latest git version" },
      -- Do something about blame lines?
      l = {
        name = "+log",
        r = {"<cmd>0Gclog<cr>", "Load all revisions of this file for each commit that affects it" },
        d = {"<cmd>Gclog<cr>", "Load all diffs of this file for each commit" },
      },
      h = {
        name = "+hunks",
        s = {"<cmd>lua require('gitsigns').preview_hunk()<CR>", "Show hunk diff"},
        n = {"<cmd>lua require('gitsigns').next_hunk({wrap = true})<CR>", "Next hunk"},
        p = {"<cmd>lua require('gitsigns').prev_hunk({wrap = true})<CR>", "Previous hunk"},
      },
    }
  }
})

-- Telescope
wk.register({
  ['<leader>'] = {
    t = {
      name = 'Telescope',
      f = {"<cmd>Telescope find_files<CR>", "Find files"},
      g = {"<cmd>Telescope live_grep<CR>", "Live grep"},
      b = {"<cmd>Telescope buffers<CR>", "Buffers"},
      h = {"<cmd>Telescope help_tags<CR>", "NVIM help"},
      k = {"<cmd>Telescope keymaps<CR>", "Keymaps"},
      p = {"<cmd>Telescope project<CR>", "Projects"},
      o = {"<cmd>Telescope oldfiles<CR>", "Last opened files"},
      t = {"<cmd>Telescope<CR>", "Default telescope"},
      r = {"<cmd>Telescope resume<CR>", "Resume last search"},
      s = {"<cmd>Telescope lsp_document_symbols<CR>", "Buffer lsp symbols"},
      S = {"<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "Workspace lsp symbols"},
      d = {"<cmd>lua require'telescope.builtin'.find_files({cwd='~/config'})<cr>", "Open NIX config directory"},
      w = {"<cmd>lua require'telescope.builtin'.find_files({cwd='~/knowledge'})<cr>", "Open Obsidian knowledge"},
    },
  }
})

-- Spelling
wk.register({
  ['<leader>'] = {
    s = {
      name = 'Spelling',
      n = {"]s", "Next spelling error"},
      p = {"[s", "Previous spelling error"},
      s = {"<cmd>lua require('telescope.builtin').spell_suggest(require('telescope.themes').get_cursor())<cr>", "Suggestion"},
      a = {"zg", "Add to dictionary"},
      t = {"<cmd>set spell!<cr>", "Toggle spell check"}
    }
  }
})

-- Diagnostics
wk.register({
  ['<leader>'] = {
    d = {
      name = 'Diagnostics',
      n = {'<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', "Next diagnostic"},
      p = {'<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', "Previous diagnostic"},
      s = {"<cmd>lua vim.diagnostic.open_float()<CR>", "Show diagnostic under cursor"},
      a = {"<cmd>TroubleToggle document_diagnostics<CR>", "Show all diagnostics for this buffer"},
      A = {"<cmd>TroubleToggle workspace_diagnostics<CR>", "Show all diagnostics for this project"},
    }
    -- Recall that in Trouble pop-up thingy there's a keymap of "m" to change between document and workspace diagnostics
  }
})

-- Comments
wk.register({
  ['<leader>'] = {
      c = {
        name = 'Comments',
        l = {"<cmd>lua require('Comment.api').toggle_current_linewise()<cr>", "Line comment"},
        b = {"<cmd>lua require('Comment.api').toggle_current_blockwise()<cr>", "Block comment"},
    }
  }
})

-- LSP
local vertical_layout = "{layout_strategy='vertical', layout_config = {mirror = true}}"
wk.register({
  K = {"<cmd>lua vim.lsp.buf.hover()<CR>", "Show documentation"},
  W = {"<cmd>lua vim.lsp.buf.signature_help()<CR>", "Show signature help"}, -- Not working
  ['<leader>'] = {
    l = {
      name = 'LSP',
      d = {string.format("<cmd>lua vim.lsp.buf.definition(%s)<CR>", vertical_layout), "Go to definition"},
      D = {string.format("<cmd>lua vim.lsp.buf.declaration(%s)<CR>", vertical_layout), "Go to declaration"},
      i = {string.format("<cmd>lua vim.lsp.buf.implementation(%s)<CR>", vertical_layout), "Go to implementation"},
      r = {string.format("<cmd>lua require('telescope.builtin').lsp_references(%s)<cr>", vertical_layout), "Show references"},
    },
  }
  -- TODO: get some extra stuff from handlers.lua
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
})


-- NvimTree
wk.register({
  ['<leader>'] = {
    n = {
      name = 'NvimTree',
      n = {"<cmd>NvimTreeToggle<cr>", "Toggle Tree"},
      e = {"<cmd>NvimTreeFindFileToggle<cr>", "Toggle tree on current file"},
      f = {"<cmd>NvimTreeFocus<cr>", "Focus on tree"},
    }
  }
})

-- Debugger
-- TODO: look at set_exception_breakpoint. Looks pretty sweet
wk.register({
  ['<leader>'] = {
    b = {
      name = 'Debugger',
      t = {"<cmd>lua require('dapui').toggle()<cr>", "Toggle debugger UI"},
      b = {"<cmd>DapToggleBreakpoint<cr>", "Toggle breakpoint at current line"},
      B = {"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", "Set breakpoint given condition"},
      e = {"<cmd>lua require('dapui').eval()<cr>", "Evaluate expresion"},

      c = {"<cmd>DapContinue<cr>", "Start / continue debugger"},
      i = {"<cmd>lua require'dap'.terminate()<cr>", "Terminate debugger session"},

      n = {"<cmd>lua require'dap'.step_over({askForTargets = true})<CR>", "Step over (next)"},
      s = {"<cmd>lua require'dap'.step_into()<CR>", "Step into"},
      o = {"<cmd>lua require'dap'.step_out()<CR>", "Step out"},
      u = {"<cmd>lua require'dap'.up()<CR>", "Up stacktrace"},
      d = {"<cmd>lua require'dap'.down()<CR>", "Down stacktrace"},
      -- GOTO?

      l = {
        name = '+Show',
        c = {"<cmd>Telescope dap commands<cr>", "Show available commands"},
        o = {"<cmd>Telescope dap configurations<cr>", "DAP configurations"},
        b = {"<cmd>Telescope dap list_breakpoints<cr>", "Show breakpoints"},
        v = {"<cmd>Telescope dap variables<cr>", "Show variables"},
        f = {"<cmd>Telescope dap frames<cr>", "Show frames"},
      }
    }
  }
})

-- Debugger: visual
wk.register({ ['<leader>b'] = { name = 'Debugger', e = {"<cmd>lua require('dapui').eval()<cr>", "Evaluate expresion"}, }}, {mode = 'v'})

-- ToggleTerm
wk.register({
  ['<leader><leader>'] = {
    name = 'Terminal',
    ['z'] = {"<cmd>NeoZoomToggle<cr>", "Zoom current buffer"},
    ['f'] = {"<cmd>ToggleTerm direction='float'<cr>", "Toggle Floating terminal"},
    ['v'] = {"<cmd>ToggleTerm direction='vertical' size=50<cr>", "Toggle vertical terminal"},
    ['h'] = {"<cmd>ToggleTerm direction='horizontal'<cr>", "Toggle horizontal terminal"},
    ['t'] = {"<cmd>ToggleTermToggleAll<cr>", "Toggle all terminals"},
  }
})


-- Development
wk.register({
  ['<C-s><C-r>'] = {"<cmd>source %<cr>", "Sources currenty file"}
})
