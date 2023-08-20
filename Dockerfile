# Update system packages
RUN apt update && apt upgrade -y

# Install Python3 and pip if they are not installed
RUN apt install python3 python3-pip -y

# Install tkinter if it's not installed (usually it is included with python3)
RUN apt install python3-tk -y

# Install requests python package
RUN pip3 install requests

# Install Docker
RUN apt install apt-transport-https ca-certificates curl software-properties-common -y \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
    && apt update \
    && apt install docker-ce -y

# Adding current user to docker group (optional)
#RUN usermod -aG docker $USER

# Test Docker installation
RUN docker run hello-world
