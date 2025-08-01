docker run -d --name fedora-target \
  --privileged \
  -p 2222:22 \
  fedora:latest \
  /bin/bash -c "
    dnf update -y && 
    dnf install -y openssh-server python3 && 
    ssh-keygen -A && 
    echo 'root:password' | chpasswd && 
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && 
    /usr/sbin/sshd -D
  "