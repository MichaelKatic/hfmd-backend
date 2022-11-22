FROM strapi/base

ENV NODE_VERSION=16.15.0
RUN apt install -y curl 
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version
RUN npm --version

ENV DATABASE_PASSWORD=VlXMdl130nsU

WORKDIR /hfmd-strapi

COPY ./hfmd-strapi/package.json ./
COPY ./hfmd-strapi/package-lock.json ./

RUN npm install

COPY ./hfmd-strapi .

ENV NODE_ENV development

RUN npm run build

EXPOSE 1337

CMD ["npm", "run", "develop"]