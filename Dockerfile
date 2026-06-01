FROM postgis/postgis:16-3.4

# Instala locales + ICU (já vem, mas garantimos consistência)
RUN apt-get update && apt-get install -y \
    locales \
    && sed -i '/pt_BR.UTF-8/s/^# //g' /etc/locale.gen \
    && locale-gen \
    && update-locale LANG=pt_BR.UTF-8 \
    && rm -rf /var/lib/apt/lists/*

# Ambiente do container
ENV LANG=pt_BR.UTF-8 \
    LANGUAGE=pt_BR:pt \
    LC_ALL=pt_BR.UTF-8 \
    POSTGRES_INITDB_ARGS="--locale-provider=icu --icu-locale=pt-BR"

