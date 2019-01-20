FROM node:8.15-stretch

RUN apt-get update && apt-get install -y curl wget build-essential libxml2-dev libcurl4-openssl-dev

ADD http://pegasus.isi.edu/montage/Montage_v3.3_patched_4.tar.gz /
RUN tar zxvf Montage_v3.3_patched_4.tar.gz && \
    make -C /Montage_v3.3_patched_4 && \
    echo "export PATH=\$PATH:/Montage_v3.3_patched_4/bin" >> /etc/bash.bashrc

WORKDIR /usr/src/app

COPY package.json .

ENV PATH $PATH:/Montage_v3.3_patched_4/bin

RUN npm install

COPY . .

ENV PORT=80

EXPOSE ${PORT}

CMD [ "npm", "start" ]
