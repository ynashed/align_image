FROM pytorch/pytorch:1.12.0-cuda11.3-cudnn8-devel

MAINTAINER Youssef Nashed "ynashed@slac.stanford.edu"

WORKDIR /work
ADD requirements.txt /work/requirements.txt

RUN apt-get update && \
    apt-get install -y git wget build-essential libtool autoconf unzip libssl-dev

RUN pip install --pre dgl -f https://data.dgl.ai/wheels/cu113/repo.html && pip install --pre dglgo -f https://data.dgl.ai/wheels-test/repo.html
RUN pip install --no-use-pep517 --no-cache-dir -r requirements.txt
