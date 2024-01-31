# Manage GCP + Terraform
FROM gcr.io/google.com/cloudsdktool/google-cloud-cli:slim

RUN apt update \
    && apt install -y wget \
    && apt install -y unzip \
    && apt install -y vim \
    && apt install -y openssh-client

RUN wget https://releases.hashicorp.com/terraform/1.7.1/terraform_1.7.1_linux_amd64.zip

RUN unzip terraform_1.7.1_linux_amd64.zip

RUN mv terraform /usr/local/bin/

WORKDIR /app

COPY ./main.sh ./main.sh
COPY ./creds.json ./creds.json
COPY ./terraform ./terraform

ENTRYPOINT [ "bash" ]
CMD [ "main.sh" ]
