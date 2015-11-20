########################################################################
#                   guacd Daemon to run in OpenShift                   #
########################################################################

FROM fedora:22

MAINTAINER Rich Lucente <rlucente@redhat.com>

LABEL vendor="Red Hat"
LABEL version="0.1"
LABEL description="guacd Daemon for OpenShift"

ENV LC_ALL=en_US.UTF-8

# Add the needed packages for guacd and set permissions so any
# unprivileged user can run guacd
RUN    dnf -y update \
    && dnf -y install \
           guacd \
           libguac-client-vnc \
    && dnf -y clean all \
    && chmod a+rwX /var/lib/guacd

USER 1000

CMD [ "/sbin/guacd", "-b", "localhost", "-L", "debug", "-f" ]

