FROM buildpack-deps:buster-scm

ENV GITDIR /etc/.pihole
ENV SCRIPTDIR /opt/pihole

RUN mkdir -p $GITDIR $SCRIPTDIR /etc/pihole
ADD . $GITDIR
RUN cp $GITDIR/advanced/Scripts/*.sh $GITDIR/gravity.sh $GITDIR/pihole $GITDIR/automated\ install/*.sh $SCRIPTDIR/
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$SCRIPTDIR

RUN true && \
    chmod +x $SCRIPTDIR/*

ENV SKIP_INSTALL true
ENV OS_CHECK_DOMAIN_NAME dev-supportedos.pi-hole.net

RUN mkdir -p test/bats_core
RUN git clone --depth=1 --quiet https://github.com/bats-core/bats-core test/bats_core > /dev/null
