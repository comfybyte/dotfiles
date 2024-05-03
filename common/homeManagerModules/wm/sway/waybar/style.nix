let
  bg = "rgba(0, 0, 0, 0.95)";
  highlight = "#C4A7E7";
  font = {
    family = "Zpix Nerd Font";
    size = "14px";
  };
in ''
  * {
    min-height: 0;
    margin: 0;
    font-family: "${font.family}";
    font-size: ${font.size};
    color: ${highlight};
  }

  #waybar {
    background: ${bg};
    border: 1px solid #000;
  }

  #cpu,
  #memory,
  #temperature,
  #pulseaudio,
  #network {
    font-weight: bolder;
    padding: 0 10px;
  }

  #cpu.warning,
  #cpu.critical {
    background: transparent;
    color: ${highlight};
  }

  #memory.warning {
    color: #A000F0;
  }

  #memory.critical {
    color: #FF00AA;
  }

  #tray {
    margin: 2px 20px;
  }

  #clock {
    font-weight: bolder;
    border-left: 1px solid ${highlight};
    padding-right: 4px;
    padding-left: 12px;
  }

  #temperature.critical {
    color: #f00;
  }

  #pulseaudio {
    border-right: 1px solid ${highlight};
    padding-right: 16px;
  }

  #workspaces {
    padding: 0;
  }

  #workspaces button {
    font-size: .4em;

    border: 2px solid transparent;
    border-radius: 0;
    padding: 4px 12px;
  }


  #workspaces button.active {
    border: 2px solid ${highlight};
    transition: border .75s;
  }
''
