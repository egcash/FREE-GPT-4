# Install requests python package
RUN pip install requests

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
