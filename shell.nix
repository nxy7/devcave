{ pkgs ? import <nixpkgs> {}
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    go
    kratos

    rustc
    rustfmt
    cargo
    clippy
    sqlx-cli
    mold

    clang
    pkg-config
    openssl.dev

    nodejs
    yarn
    nodePackages.pnpm

    tmux
    zsh

    lua
    luajit
    luarocks

    docker
    docker-compose
  ];
  
  RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
  RUST_BACKTRACE = 1;

  # OPENSSL_DEV=openssl.dev;
  shellHook = ''
    echo 'Shell started...'
    echo 'You can start the app by running ./start_script.sh'
    #./start_script.sh
  '';
}