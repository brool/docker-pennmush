# Docker / PennMUSH 

A Docker image for PennMUSH.  I know, I know, are we in the 80s again?
But some friends wanted to get all old-school and try a MUSH. 

## Building

To build the Docker image:

    docker build -t mush . 

## Initializing

This version of PennMUSH dumps entirely to disk files (i.e., no
database involved).  You'll need to map /pennmush to some local
directory.  Before running PennMUSH for the first time, you'll need to
initialize the data directories:

    docker run -i -t -v /usr/local/pennmush:/pennmush mush /root/init

## Running

To run it you'll just run the image in detached mode, being sure to
map to your data directory.

    docker run -p 4201:4201 -d -t -v /usr/local/pennmush:/pennmush mush

## One More Thing

Be sure to set a password for One (the root wizard).  Telnet into the server at port 4201 and:

    connect one
    @password =somenewpassword
    @dump
