FROM puckel/docker-airflow
MAINTAINER Yu XiaoRui

COPY sources.list /etc/apt/sources.list
COPY requirements.txt /opt/python/app/requirements.txt

RUN set -x \
    && buildDeps=' \
        gcc \
        libbz2-dev \
        libc6-dev \
        libdb-dev \
        libgdbm-dev \
        libncurses-dev \
        libreadline-dev \
        libsqlite3-dev \
        libssl-dev \
        make \
        tcl-dev \
        tk-dev \
        wget \
        xz-utils \
        zlib1g-dev \
        curl \
        g++ \
        libffi-dev \
        libmysqld-dev \
        libxml2-dev \
        libxslt-dev \
        libblas-dev \
        liblapack-dev \
        libatlas-base-dev \
        gfortran \
        supervisor \
    ' \
    && apt-get update && apt-get install -y $buildDeps --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --no-cache-dir -r /opt/python/app/requirements.txt --trusted-host pypi.douban.com -i http://pypi.douban.com/simple \
    && apt-get autoremove \
    && apt-get clean \
    && rm -rf /usr/src/python ~/.cache \
    && rm -rf /var/tmp