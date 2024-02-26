return {
  "nvim-java/nvim-java",
  ft = "java",
  dependencies = {
    "nvim-java/lua-async-await",
    "nvim-java/nvim-java-core",
    "nvim-java/nvim-java-test",
    "nvim-java/nvim-java-dap",
    "mfussenegger/nvim-dap",
    {
      "williamboman/mason.nvim",
      opts = {
        registries = {
          "github:nvim-java/mason-registry",
          "github:mason-org/mason-registry",
        },
      },
    },
  },
}

-- ○ lua-async-await  nvim-java
-- ○ nvim-dap  nvim-java
-- ○ nvim-dap-python  <leader>dPt  <leader>dPc  nvim-dap
-- ○ nvim-java
-- ○ nvim-java-core  nvim-java
-- ○ nvim-java-dap  nvim-java
-- ○ nvim-java-test  nvim-java
