return {
  {
    "chrisgrieser/nvim-early-retirement",
    config = true,
    event = "VeryLazy",
    opts = {
      ignoreVisibleBuffers = false,
      retirementAgeMins = 120,
    },
  },
}
