FROM centos:centos7
MAINTAINER drewstillman13@gmail.com

ENV container docker

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install httpd && \
    yum -y install bind-utils bind && \
    yum clean all
	
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
	rm -f /lib/systemd/system/multi-user.target.wants/*;\
	rm -f /etc/systemd/system/*.wants/*;\
	rm -f /lib/systemd/system/local-fs.target.wants/*; \
	rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
	rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
	rm -f /lib/systemd/system/basic.target.wants/*;\
	rm -f /lib/systemd/system/anaconda.target.wants/*;

#VOLUME [ "/sys/fs/cgroup", "/named" ]

#CMD ["/usr/sbin/init"]


#EXPOSE 80
#ADD run-httpd.sh /run-httpd.sh
#RUN chmod -v +x /run-httpd.sh
#CMD ["/run-httpd.sh"]

#ADD container-image-root /

#RUN rndc-confgen -a -c /etc/rndc.key && \
    chown named:named /etc/rndc.key && \
    chmod 755 /entrypoint.sh
#RUN chmod -v +x /entrypoint.sh

#EXPOSE 53/udp 53/tcp
#ENTRYPOINT ["/entrypoint.sh"]
#CMD ["/usr/sbin/named"]
