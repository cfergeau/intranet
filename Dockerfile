FROM quay.io/centos/centos:stream8 AS build
RUN rpm --import https://dl.yarnpkg.com/rpm/pubkey.gpg && curl -sL https://dl.yarnpkg.com/rpm/yarn.repo -o /etc/yum.repos.d/yarn.repo
RUN dnf -y module enable nodejs:16
RUN dnf -y install nodejs yarn
WORKDIR $APP_ROOT/src
COPY . .
RUN yarn

FROM quay.io/centos/centos:stream8
RUN rpm --import https://dl.yarnpkg.com/rpm/pubkey.gpg && curl -sL https://dl.yarnpkg.com/rpm/yarn.repo -o /etc/yum.repos.d/yarn.repo
RUN dnf -y module enable nodejs:16
RUN dnf -y install nodejs yarn
WORKDIR $APP_ROOT/src
COPY --from=build $APP_ROOT/src .
EXPOSE 3000/tcp
ENTRYPOINT ["yarn dev"]
