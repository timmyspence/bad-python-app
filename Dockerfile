FROM python:3.7


RUN apt-get update && apt-get install -y imagemagick

RUN groupadd -g 1010 semgrep && \
    useradd -m -u 1010 -g semgrep semgrep

USER semgrep
WORKDIR /usr/src/app

COPY . .

RUN sh setup.sh

ENV FLASK_APP app
ENV FLASK_ENV development

EXPOSE 5000

# CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
CMD [ "sh", "run.prod.sh"]
