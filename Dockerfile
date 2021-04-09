FROM node:14.16.0

ENV METEOR_HOME=/app

RUN mkdir -p $METEOR_HOME

WORKDIR $METEOR_HOME

COPY . $METEOR_HOME

RUN curl https://install.meteor.com/ | sh

# install dependencies
RUN npm install

RUN chown -Rh $USER:$USER .meteor/local

EXPOSE 3000

ENTRYPOINT ["./docker-entrypoint.sh"]