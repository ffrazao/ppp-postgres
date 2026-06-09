FROM postgis/postgis:16-3.4

# Instala locales + ICU
RUN apt-get update && apt-get install -y locales \
    && echo "pt_BR.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen pt_BR.UTF-8 \
    && rm -rf /var/lib/apt/lists/*

# Ambiente do container
ENV LANG=pt_BR.UTF-8 \
    LANGUAGE=pt_BR:pt \
    LC_ALL=pt_BR.UTF-8 \
    POSTGRES_INITDB_ARGS="--locale-provider=icu --icu-locale=pt-BR"

