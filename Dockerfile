FROM ubuntu:20.04

# タイムゾーンを東京に設定
ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# apt-get に対話的に設定を確認されないための設定
ENV DEBIAN_FRONTEND=noninteractive

# 依存パッケージをインストール
RUN apt-get update && \
    apt-get install -y --no-install-recommends software-properties-common && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt-get install -y \
        build-essential cmake gcc g++ \
        curl unzip xz-utils \
        libblas3 libblas-dev \
        mecab libmecab-dev swig \
        locales nkf \
        python3.11 \
        python3.11-dev \
        python3.11-distutils \
        python3.11-venv \
        zlib1g \
        zlib1g-dev && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

# ロケールを日本語に設定
RUN locale-gen ja_JP.UTF-8 \
    && echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc

# pip をインストール
RUN curl https://bootstrap.pypa.io/get-pip.py | python3.11

# UniDic をインストール
WORKDIR /code/
RUN curl -LO https://clrd.ninjal.ac.jp/unidic_archive/cwj/2.1.2/unidic-mecab_kana-accent-2.1.2_src.zip && \
    unzip unidic-mecab_kana-accent-2.1.2_src.zip && \
    cd unidic-mecab_kana-accent-2.1.2_src && \
    ./configure && make && make install && cd - && \
    rm unidic-mecab_kana-accent-2.1.2_src.zip && rm -rf unidic-mecab_kana-accent-2.1.2_src

# 依存関係をインストール
COPY requirements.txt /code/
RUN pip install -r /code/requirements.txt

# tdmelodic モジュールをインストール
COPY . /code/
RUN pip install .

# ワークスペースディレクトリ
ARG workspace=/root/workspace
RUN mkdir -p $workspace
WORKDIR $workspace
