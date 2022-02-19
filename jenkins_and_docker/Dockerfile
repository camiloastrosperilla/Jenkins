FROM centos #Pull centos Image

RUN yum -y install openssh-server  #Install package openssh-server

RUN useradd remote_user && \  #Create remote_user
  echo "1234" | passwd remote_user -- stdin && \  #Add passwd to remote_user
  mkdir /home/remote_user/.ssh && \  #create ssh Dir
  chmod 700 /home/remote_user/.ssh  #Add permission 700 at .ssh directory.

#Create key "ssh-keygen -f remote-key
COPY remote-key.pub /home/remote_user/.ssh/authorized_keys  #cp public key.   

RUN /usr/sbin/sshd-keygen > /dev/null 2>&1  #Avoid generic error.

CMD /usr/sbin/sshd -D  #Start service sshd
