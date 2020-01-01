FROM lambci/lambda:build-python3.7 as build

COPY lambdapacker /lambdapacker

RUN chmod u+x /lambdapacker/package.sh

WORKDIR /app/src
RUN mkdir -p /app/src

ENTRYPOINT [ "/lambdapacker/package.sh" ]
