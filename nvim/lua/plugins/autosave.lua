return {
  {
    -- Autosave automatically
    "okuuva/auto-save.nvim",
    cmd = "ASToggle", -- optional for lazy loading on command
    opts = {
      trigger_events = { -- See :h events
        immediate_save = { "BufLeave", "FocusLost" }, -- vim events that trigger an immediate save
        defer_save = {}, -- vim events that trigger a deferred save (saves after `debounce_delay`)
        cancel_defered_save = {}, -- vim events that cancel a pending deferred save
      },
    },
  },
}
