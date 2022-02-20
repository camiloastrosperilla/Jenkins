FROM centos  #Install package openssh-server

RUN yum -y install openssh-server  #Install package openssh-server

RUN yum -y install -y passwd

RUN useradd remote_user && \  #Add passwd to remote_user
  echo "1234" | passwd remote_user --stdin && \
  mkdir /home/remote_user/.ssh && \
  chmod 700 /home/remote_user/.ssh

COPY remote-key.pub /home/remote_user/.ssh/authorized_keys  #cp public key.  

RUN chown remote_user:remote_user -R /home/remote_user && \
    chmod 600 /home/remote_user/.ssh/authorized_keys

RUN /usr/sbin/sshd-keygen > /dev/null 22>&1  #Avoid generic error.

CMD /usr/sbin/sshd -D 

