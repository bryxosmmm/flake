{ ... }:
{
  programs.helix.themes = {
    nordicus = {
      inherits = "nord";

      "ui.background" = { };
      "ui.statusline" = { fg = "fg"; bg = "none"; };
      "ui.statusline.inactive" = { fg = "comment"; bg = "none"; };
      "ui.popup" = { bg = "none"; };
      "ui.window" = { bg = "none"; };
      "ui.help" = { bg = "none"; fg = "fg"; };

      "ui.virtual.inlay-hint" = { fg = "gray"; modifiers = [ "bold" "italic" ]; };
    };
  };
}
