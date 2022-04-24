FROM centos:7
 
RUN yum -y install openssh-server
 
RUN yum install -y passwd
 
RUN useradd remote_user1 && \
    echo "1234" | passwd remote_user1  --stdin && \
    mkdir /home/remote_user1/.ssh && \
    chmod 700 /home/remote_user1/.ssh
 
COPY remote_key1.pub /home/remote_user1/.ssh/authorized_keys
 
RUN chown remote_user1:remote_user1 -R /home/remote_user1/.ssh && \
    chmod 600 /home/remote_user1/.ssh/authorized_keys
 
RUN /usr/sbin/sshd-keygen > /dev/null 2>&1
 
CMD /usr/sbin/sshd -D
