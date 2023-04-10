FROM debian:10.13

WORKDIR /workspaces
RUN chmod 777 /workspaces

# neovim 
RUN apt-get update && apt-get install -y \
  git \
  ninja-build \
  gettext \
  libtool-bin \
  cmake \
  g++ \
  pkg-config \
  unzip \
  curl \
  && git clone https://github.com/neovim/neovim.git \
  && cd neovim \
  && make CMAKE_BUILD_TYPE=RelWithDebInfo \
  && make install

# user
RUN useradd --home-dir /workspaces --shell /bin/bash dev \
  && echo "dev:dev" | chpasswd \
  && apt-get install -y sudo \
  && adduser dev sudo

# zsh
RUN apt-get install -y \
  zsh
COPY --chown=dev:dev config/zshrc /workspaces/.zshrc 
USER dev
# zsh plugins
RUN mkdir -p ~/.zsh/plugins \
  && git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/plugins/zsh-autosuggestions
# zsh themes
RUN mkdir -p ~/.zsh/themes \
  && git clone https://github.com/romkatv/powerlevel10k.git ~/.zsh/themes/powerlevel10k
COPY --chown=dev:dev config/p10k.zsh /workspaces/.p10k.zsh

# neovim
COPY --chown=dev:dev config/nvim/ /workspaces/.config/nvim/
RUN mkdir -p ~/.config/nvim/pack/plugins/opt \
  && mkdir -p ~/.config/nvim/pack/plugins/start \
  && cd ~/.config/nvim/pack/plugins/start \
  && git clone https://github.com/hrsh7th/cmp-buffer.git \
  && git clone https://github.com/hrsh7th/cmp-nvim-lsp.git \
  && git clone https://github.com/hrsh7th/cmp-nvim-lua.git \
  && git clone https://github.com/hrsh7th/cmp-path.git \
  && git clone https://github.com/hrsh7th/nvim-cmp.git \
  && git clone https://github.com/neovim/nvim-lspconfig.git \
  && git clone https://github.com/dcampos/nvim-snippy.git \
  && git clone https://github.com/nvim-lualine/lualine.nvim.git

CMD ["sleep", "infinity"]
