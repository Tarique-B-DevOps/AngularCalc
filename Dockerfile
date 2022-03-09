FROM node:14 AS BUILDER
RUN mkdir /myapp
WORKDIR /myapp
COPY package.json /myapp

RUN npm install

COPY . /myapp

RUN npm install -g @angular/cli

RUN ng build

FROM httpd
COPY --from=builder /myapp/dist/angularCalc /usr/local/apache2/htdocs

