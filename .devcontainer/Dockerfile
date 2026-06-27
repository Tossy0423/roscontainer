FROM osrf/ros:jazzy-desktop-full

ENV DEBIAN_FRONTEND noninteractive
ENV TZ Asia/Tokyo

COPY crontab /var/spool/cron/crontabs/root

RUN ln -fs /usr/share/zoneinfo/$TZ /etc/localtime \
    && apt-get update && apt-get install --no-install-recommends -y \
    gdb \
    valgrind \
    cppcheck \
    clangd \
    cron \
    && echo "ubuntu ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && echo "source /opt/ros/jazzy/setup.bash" >> /home/ubuntu/.bashrc \
    && /usr/bin/crontab /var/spool/cron/crontabs/root \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV SHELL /bin/bash
USER ubuntu
CMD ["/bin/bash"]