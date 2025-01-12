FROM python:3.7.2-alpine

RUN adduser --disabled-password enum
WORKDIR /home/enum
ADD ./* /home/enum/

ENV PATH="$PATH:/home/enum/.local/bin"

RUN apk add \
        firefox-esr \
        bash; \
    chmod +x setup.sh; 

USER enum
RUN ./setup.sh;

ENTRYPOINT ["python", "check.py"]

