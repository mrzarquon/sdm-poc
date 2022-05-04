FROM gitpod/workspace-full

RUN curl -J -o sdm.zip -L https://app.strongdm.com/releases/cli/linux && \
    unzip sdm.zip && \
    rm sdm.zip && \
    mkdir -p /opt/strongdm/bin && \
    mv sdm /opt/strongdm/bin && \
    chown -R gitpod:gitpod /opt/strongdm/bin && chmod +x /opt/strongdm/bin/sdm

USER gitpod

COPY ./sdm.sh /opt/strongdm/bin/sdm-launcher
RUN chmod +x /opt/strongdm/bin/sdm-launcher