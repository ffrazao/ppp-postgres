FROM postgis/postgis:16-3.4

# Ambiente do container
ENV LANG=pt_BR.UTF-8 \
    LANGUAGE=pt_BR:pt \
    LC_ALL=pt_BR.UTF-8 \
    POSTGRES_INITDB_ARGS="--locale-provider=icu --icu-locale=pt-BR"

