FROM gitpod/workspace-full

USER root

RUN curl -J -o sdm.zip -L https://app.strongdm.com/releases/cli/linux && \
    unzip sdm.zip && \
    rm sdm.zip && \
    mkdir -p /opt/strongdm/bin && \
    mv sdm /opt/strongdm/bin && \
    chmod +x /opt/strongdm/bin/sdm

COPY ./sdm.sh /opt/strongdm/bin/sdm-launcher

RUN chown -R gitpod:gitpod /opt/strongdm/bin

USER gitpod

RUN /opt/strongdm/bin/sdm -v