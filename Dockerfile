FROM knipegp/docker-base:0.0.1

USER root
WORKDIR /root

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3=3.6.7-1~18.04 \
    python3-doc=3.6.7-1~18.04 \
    # Pip requirements
    python3-pip=9.0.1-2.3~ubuntu1.18.04.1 \
    python3-dev=3.6.7-1~18.04 \
    python3-setuptools=39.0.1-2 \
    python-setuptools-doc=39.0.1-2 \
    python3-wheel=0.30.0-0.2 \
    python3-keyring=10.6.0-1 \
    python3-keyrings.alt=3.0-1 \
    python3-xdg=0.25-4ubuntu1 \
    && rm -rf /var/lib/apt/lists/*

USER developer
WORKDIR /home/developer

RUN pip3 install --user pylint==2.4.4
RUN pip3 install --user mypy==0.761
RUN pip3 install --user black==19.10b0

ENV PATH="~/.local/bin:${PATH}"

COPY PythonPlugIns.vim ./
COPY mypy.ini ./.mypy.ini
RUN cat PythonPlugIns.vim >> ./dotfiles/vimscripts/PlugIns.vim
