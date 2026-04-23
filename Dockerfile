FROM postgis/postgis:16-3.4

# Instala locales + ICU (já vem, mas garantimos consistência)
RUN apt-get update && apt-get install -y \
    locales \
    && sed -i '/pt_BR.UTF-8/s/^# //g' /etc/locale.gen \
    && locale-gen \
    && update-locale LANG=pt_BR.UTF-8 \
    && rm -rf /var/lib/apt/lists/*

# Ambiente do container
ENV LANG=pt_BR.UTF-8
ENV LANGUAGE=pt_BR:pt
ENV LC_ALL=pt_BR.UTF-8

# PostgreSQL com ICU
ENV POSTGRES_INITDB_ARGS="--locale-provider=icu --icu-locale=pt-BR"

EXPOSE 5432
