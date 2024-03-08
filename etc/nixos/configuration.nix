{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "nixos";
  networking.wireless.enable = true;

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  services.xserver.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.xkb.layout = "us";
  services.xserver.libinput.enable = true;

  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Make the fish shell available
  programs.fish.enable = true;

  users.users.jaeden = {
    initialPassword = "pw123";
    uid = 1001;
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      SDL2
      aria
      astyle
      audacity
      autoconf
      automake
      bazel
      bison
      ccache
      checkbashisms
      chessx
      clinfo
      cmake
      conky
      cppcheck
      darktable
      dos2unix
      dosbox
      emscripten
      ffmpeg
      firefox
      fish
      gcc
      gdb
      gimp
      git
      gnum4
      gnumake
      golint
      gqrx
      gtkwave
      include-what-you-use
      inetutils
      irssi
      jq
      k4dirstat
      lcov
      ledger
      lftp
      libreoffice
      mesa-demos
      mgba
      nmap
      octaveFull
      pstree
      quarto
      racket
      radare2
      stockfish
      subversion
      tmux
      tree
      valgrind
      verilog
      vlc
      weather
      wsjtx

      # Install GNU Radio, including extra GNU Radio and Python packages
      (gnuradio.override {
        extraPackages = with gnuradioPackages; [
          osmosdr
        ];
        extraPythonPackages = with gnuradio.python.pkgs; [
          numpy
        ];
      })
    ];
  };

  environment.systemPackages = with pkgs; [
    vim
    wget

    # Globally install perl modules
    (perl.withPackages(ps: [
      ps.URI
    ]))
  ];

  services.openssh.enable = true;

  networking.firewall.allowedTCPPorts = [
    22
  ];
  networking.firewall.allowedUDPPorts = [
  ];
  networking.firewall.enable = true;

  system.stateVersion = "23.11";
}
