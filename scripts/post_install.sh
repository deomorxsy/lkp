 #!/usr/bin/bash
# if systemd as init system

# Enable password authentication for SSH
d-i preseed/late_command string \
    echo 'PasswordAuthentication yes' >> /target/etc/ssh/sshd_config; \
    systemctl restart sshd

# Generate SSH host keys
d-i preseed/late_command string \
    rm /target/etc/ssh/ssh_host_*; \
    ssh-keygen -A -f /target

# Set up SSH authorized keys for Ansible bastion host
d-i preseed/late_command string \
    mkdir -p /target/root/.ssh; \
    echo 'ssh-rsa <ansible_bastion_public_key>' >> /target/root/.ssh/authorized_keys; \
    chmod 700 /target/root/.ssh; \
    chmod 600 /target/root/.ssh/authorized_keys

# Disable password authentication after setup
d-i preseed/late_command string \
    echo 'PasswordAuthentication no' >> /target/etc/ssh/sshd_config; \
    systemctl restart sshd
