{ ... }:
{
  programs.helix.languages = {
    language = [
      {
        name = "rust";
        "language-servers" = [ "rust-analyzer" ];
      }
      {
        name = "python";
        "language-servers" = [ "ty" ];
        formatter = {
          command = "ruff";
          args = [ "format" "-" ];
        };
        "auto-format" = true;
      }
      {
        name = "typst";
        "language-servers" = [ "tinymist" ];
        "auto-format" = true;
        formatter = {
          command = "typstyle";
        };
      }
      {
        name = "go";
        roots = [ "go.work" "go.mod" ];
        "auto-format" = true;
        formatter = {
          command = "goimports";
        };
        "language-servers" = [ "gopls" ];
      }
      {
        name = "cpp";
        "language-servers" = [ "clangd" ];
        "auto-format" = true;
      }
      {
        name = "c";
        "language-servers" = [ "clangd" ];
        "auto-format" = true;
      }
    ];

    "language-server" = {
      "rust-analyzer" = {
        command = "rust-analyzer";
        config = {
          check = { command = "clippy"; };
        };
      };

      ty = {
        command = "ty";
      };

      gopls = {
        command = "gopls";
        config = {
          gofumpt = true;
          staticcheck = true;
          semanticTokens = true;
        };
      };

      clangd = {
        command = "clangd";
        args = [
          "--clang-tidy"
          "--background-index"
          "--completion-style=detailed"
          "--header-insertion=iwyu"
        ];
      };
    };
  };
}
