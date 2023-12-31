FROM library/python:3.11-slim-bookworm

ARG USER=vscode
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update \
    && apt install -y --no-install-recommends sudo bash-completion git openssh-client pipx \
    && apt autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && echo 'source /etc/profile.d/bash_completion.sh' >> /etc/bash.bashrc \
    && echo 'eval "$(register-python-argcomplete pipx)"' >> /etc/bash.bashrc \
    && useradd -m -s /usr/bin/bash ${USER} \
    && echo "${USER} ALL=(ALL) NOPASSWD: ALL" >/etc/sudoers.d/${USER} \
    && chmod 0440 /etc/sudoers.d/${USER}

USER ${USER}
RUN pipx ensurepath \
    && pipx install esphome \
    && pipx install bk7231tools
