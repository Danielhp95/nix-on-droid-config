local actions = require('telescope.actions')
local pickers = require'telescope.pickers'
local sorters = require'telescope.sorters'
local finders = require'telescope.finders'
local previewers = require'telescope.previewers'
local from_entry = require'telescope.from_entry'
local actions_set = require'telescope.actions.set'
local utils = require'telescope.utils'
local action_set = require('telescope.actions.set')

local function action_edit_ctrl_l(prompt_bufnr)
    return action_set.select(prompt_bufnr, "ctrl-l")
end

local function action_edit_ctrl_r(prompt_bufnr)
    return action_set.select(prompt_bufnr, "ctrl-r")
end

local action_layout = require('telescope.actions.layout')
require('telescope').setup {
  defaults = {
      -- Appearance
      entry_prefix = "  ",
      prompt_prefix = "   ",
      selection_caret = ">  ",
      color_devicons = true,
      path_display = { "absolute" },
      layout_config = {
          prompt_position = "bottom",
      },
      sorting_strategy = "descending",
      layout_strategy = 'horizontal',
      --layout_config = {
      --    prompt_position = "bottom",
      --},
      -- sorting_strategy = "descending",
      -- layout_strategy = 'horizontal',
      mappings = {
          i = {
              ["<C-u>"] = false,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<CR>" ] = actions.select_default + actions.center,
              ["<C-s>"] = actions.select_horizontal,
              -- ["<esc>"] = actions.close,
              ["<C-l>"] = action_edit_ctrl_l,
              ["<C-r>"] = action_edit_ctrl_r,
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,
              ['<a-j>'] = function(prompt_bufnr) action_layout.cycle_layout_next(prompt_bufnr) end,
              ['<a-k>'] = function(prompt_bufnr) action_layout.cycle_layout_prev(prompt_bufnr) end,
          },
          n = {
              ["<esc>"] = actions.close,
          },
      },
  },
  pickers = {
      buffers = {
          ignore_current_buffer = true,
          sort_mru = true,
          mappings = {
            i = { ['<c-r>'] = 'delete_buffer' },
            n = { ['<c-r>'] = 'delete_buffer' },
          },
      },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                      -- the default case_mode is "smart_case"
    }
  }
}
--
--require('telescope').load_extension('gh')
require('telescope').load_extension('dap')
require('telescope').load_extension('project')
require('telescope').load_extension('fzf')

-- Custom pickers
local cdPicker = function(name, cmd)
    pickers.new({}, {
        prompt_title = name,
        finder = finders.new_table{ results = utils.get_os_command_output(cmd) },
        previewer = previewers.vim_buffer_cat.new({}),
        sorter = sorters.get_fuzzy_file(),
        attach_mappings = function(prompt_bufnr)
            actions_set.select:replace(function(_, type)
                local entry = actions.get_selected_entry()
                actions.close(prompt_bufnr)
                local dir = from_entry.path(entry)
                vim.cmd('cd '..dir)
            end)
            return true
        end,
    }):find()
end

function Cd(path)
    path = path or '.'
    cdPicker('Cd', {vim.o.shell, '-c', "fd . "..path.." --type=d 2>/dev/null"})
end

function Cdz()
    cdPicker('z directories', {vim.o.shell, '-c', "cat ~/.z | cut -d '|' -f1"})
end

function File_picker()
    vim.fn.system('git rev-parse --git-dir > /dev/null 2>&1')
    local is_git = vim.v.shell_error == 0
    if is_git then
        require'telescope.builtin'.find_files()
    else
        vim.cmd 'Files'
    end
end
