#FROM jupyter/datascience-notebook
FROM python:3.7.6-slim-stretch 

RUN mkdir -p /opt/python/work/data && \
    mkdir -p /opt/python/work/notebooks && \
    mkdir -p /opt/python/work/jupyterlab && \
    mkdir -p /opt/python/work/jupyter
WORKDIR /opt/python/work
COPY requirements.txt .
COPY requirements.lock .
COPY ./jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

# To avoid warnings when use apt-get
ENV DEBCONF_NOWARNINGS yes

# Install Node.js to use extensions in jupyterlab
USER root
RUN apt update
RUN apt install -y sudo
RUN sudo apt install -y curl build-essential
RUN sudo curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
RUN sudo apt-get install -y nodejs

# Install git
RUN apt install -y git

# Install mecab
# RUN sudo apt install -y mecab libmecab-dev mecab-ipadic-utf8
# RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git
# RUN cd mecab-ipadic-neologd \
#     && bin/install-mecab-ipadic-neologd -n -y

# Install python modules
RUN python -m pip install --upgrade pip
RUN python -m pip install -r requirements.lock

# Insall jupyterlab extensions
RUN jupyter serverextension enable --py jupyterlab --sys-prefix \
 && jupyter labextension install @lckr/jupyterlab_variableinspector @jupyterlab/toc \
 @ryantam626/jupyterlab_code_formatter 

# If you are vimmer, please enable below
# RUN jupyter labextension install jupyterlab_vim
 
RUN jupyter serverextension enable --py jupyterlab_git jupyterlab_code_formatter 

EXPOSE 8888
CMD ["jupyter", "lab", "--allow-root"]