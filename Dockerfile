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
COPY --chown=dev:dev zshrc.conf /workspaces/.zshrc 
USER dev
# zsh plugins
RUN mkdir -p ~/.zsh/plugins \
  && git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/plugins/zsh-autosuggestions
RUN mkdir -p ~/.zsh/themes \
  && git clone https://github.com/romkatv/powerlevel10k.git ~/.zsh/themes/powerlevel10k

CMD ["sleep", "infinity"]
