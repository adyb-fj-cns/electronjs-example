FROM flyway/flyway
COPY ./conf/flyway.conf /flyway/conf
COPY ./sql /flyway/sql 

ENTRYPOINT flyway migrate
