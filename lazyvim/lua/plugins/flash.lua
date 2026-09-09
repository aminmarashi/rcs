return {
  "folke/flash.nvim",
  keys = {
    -- Disable the default 's' and 'S' shortcuts
    { "s", mode = { "n", "x", "o" }, false },
    { "S", mode = { "n", "x", "o" }, false },

    -- Map '?' to trigger Flash jump
    {
      "?",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash Search",
    },
  },
}
