local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local make_entry = require("telescope.make_entry")

-- Parse user input into ripgrep CLI args
local function parse_args(prompt)
  local words = vim.split(prompt, "%s+")

  local args = { "rg", "--color=never", "--no-heading", "--with-filename",
                 "--line-number", "--column", "--smart-case", "--glob !rockyou.txt" }

  for _, w in ipairs(words) do
    if w ~= "" then
      table.insert(args, w)
    end
  end

  return args
end

return function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.loop.cwd()

  local grepper = finders.new_async_job({
    command_generator = function(prompt)
      if not prompt or prompt == "" then
        return nil
      end

      local args = parse_args(prompt)
      return args
    end,

    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  })

  pickers
    .new(opts, {
      prompt_title = "RG (raw args)",
      finder = grepper,
      previewer = conf.grep_previewer(opts),
      sorter = require("telescope.sorters").empty(),
      debounce = 50,
    })
    :find()
end
