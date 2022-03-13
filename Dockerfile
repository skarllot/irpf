FROM docker.io/openjdk:11

# Install required dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgtk2.0-0 libcanberra-gtk-module libxext-dev libxrender-dev libxtst-dev \
    && rm -rf /var/lib/apt/lists/*

# Download and unzip IRPF 2021 program
RUN wget https://downloadirpf.receita.fazenda.gov.br/irpf/2021/irpf/arquivos/IRPF2021-1.5.zip -O irpf.zip \
    && unzip irpf.zip -d /opt/ \
    && mv /opt/IRPF*/ /opt/irpf

# Create user and group irpf
RUN groupadd --gid 1000 irpf && \
    useradd --gid 1000 --uid 1000 --create-home --shell /bin/bash irpf

USER irpf

CMD ["java", "-Xms128M", "-Xmx512M", "-Dawt.useSystemAAFontSettings=on", "-Dswing.aatext=true", "-Dsun.java2d.xrender=true", "-jar", "/opt/irpf/irpf.jar"]

