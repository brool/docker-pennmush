FROM ubuntu:14.04

# Set correct environment variables.
ENV HOME /root

RUN apt-get update -qq
RUN apt-get install -y pennmush make

RUN useradd -m mud -G games
ADD pennmush-init /root/init

ADD restart /home/mud/restart
RUN chown mud:mud /home/mud/restart

EXPOSE 4201

# No way to run PennMUSH in foreground mode as far as I can tell...
CMD sudo -u mud bash -c "/home/mud/restart" && cat
