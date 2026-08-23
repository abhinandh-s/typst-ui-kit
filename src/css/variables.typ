#let init = "
/* --- Dark (Default) --- */
:root, :root[data-theme=\"dark\"] { 
  color-scheme: dark; 
  --bg: #0B0706;
  --fg: #bcbdd0;
  --secondary-bg: #181010;
  --sidebar-bg: #181010;
  --sidebar-fg: #c8c9db;
  --accent: #e05060;

  --base: #1e1e2e;
  --mantle: #181825;
  --text: #cdd6f4;
  --subtext0: #a6adc8;
  --surface0: #313244;
  --surface1: #45475a;
  --mauve: #cba6f7;
  --blue: #8caaee;
  --sapphire: #74c7ec;
  --peach: #fab387;
  --green: #a6e3a1;
  --red: #f38ba8;
}


/* --- Light Mode --- */
:root[data-theme=\"light\"] {
  color-scheme: light;
  --bg: #eff1f5;
  --fg: #4c4f69;
  --secondary-bg: #fafafa;
  --sidebar-bg: #fafafa;
  --sidebar-fg: #a1adb8;
  --accent: #d20f39;

  --base: #eff1f5;
  --mantle: #e6e9ef;
  --text: #4c4f69;
  --subtext0: #6c6f85;
  --surface0: #ccd0da;
  --surface1: #bcc0cc;
  --mauve: #8839ef;
  --blue: #1e66f5;
  --sapphire: #209fb5;
  --peach: #fe640b;
  --green: #40a02b;
  --red: #d20f39;
}
"