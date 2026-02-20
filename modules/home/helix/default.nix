{ ... }:
{
  imports = [
    ./languages.nix
    ./theme.nix
  ];

  programs.helix = {
    enable = true;
    settings = {
      theme = "nordicus";

      editor = {
        "line-number" = "relative";
        cursorline = false;
        "completion-timeout" = 2;
        "completion-replace" = true;
        "auto-completion" = true;
        "auto-format" = true;
        "auto-pairs" = false;
        "color-modes" = true;

        lsp = {
          "display-inlay-hints" = true;
          "inlay-hints-length-limit" = 25;
        };

        statusline = {
          left = [ "mode" "file-name" "spinner" ];
          center = [ ];
          right = [
            "diagnostics"
            "selections"
            "position"
            "position-percentage"
            "file-encoding"
            "file-type"
          ];
          separator = "│";
        };

        "cursor-shape" = {
          normal = "underline";
          select = "underline";
          insert = "underline";
        };

        whitespace = {
          render = {
            tab = "all";
            nbsp = "all";
          };
          characters = {
            nbsp = "x";
          };
        };

        "inline-diagnostics" = {
          "cursor-line" = "hint";
          "other-lines" = "disable";
          "prefix-len" = 2;
          "max-wrap" = 20;
        };

        "soft-wrap" = {
          enable = true;
        };
      };

      keys = {
        normal = {
          "C-s" = ":write";
          "C-q" = ":quit";
          "}" = "goto_next_paragraph";
          "{" = "goto_prev_paragraph";
          "S-j" = [ "extend_to_line_bounds" "delete_selection" "paste_after" ];
          "S-k" = [ "extend_to_line_bounds" "delete_selection" "move_line_up" "paste_before" ];
        };
        select = {
          "}" = "goto_next_paragraph";
          "{" = "goto_prev_paragraph";
        };
        insert = {
          "C-y" = "completion";
        };
      };
    };
  };
}
