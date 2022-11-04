FROM strapi/base

WORKDIR /hfmd-cms

COPY ./package.json ./
COPY ./package-lock.json ./

RUN npm install

COPY . .

ENV NODE_ENV development

RUN npm run build

EXPOSE 1337

CMD ["yarn", "start"]