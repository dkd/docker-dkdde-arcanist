# dkdde/arcanist

## Docker Data Volume Container Arcanist

This Docker image `dkdde/arcanist` consists of

* defined and *stable* Git checkout of [Arcanist](https://github.com/phacility/arcanist)
* defined and *stable* Git checkout of [libphutil](https://github.com/phacility/libphutil)

to be run as [Docker Data Volume Container](https://docs.docker.com/engine/tutorials/dockervolumes/). PHP is _not_ included.

### Installation/Setup

Download latest Docker image:

    $ docker pull dkdde/arcanist

or a specific version (tag):

    $ docker pull dkdde/arcanist:arcanist-21fe07925b07_libphutil-d02cc05931b0

In this case `21fe07925b07` references a Git commit hash in the Arcanist repository, `d02cc05931b0` points to a commit hash in the libphutil repository. See list of available tags at the [Docker Hub project page](https://hub.docker.com/r/dkdde/arcanist/tags/). 

### Usage

Create data volume container, name it `arcanist` expose `/arc`:

    $ docker create -v /arc --name arcanist dkdkd/arcanist:latest /bin/true

Mount and run Arcanist executable (PHP v7.0):

    $ docker run -it --volumes-from arcanist php:7.0-cli /arc/arcanist/bin/arc --help

Try another PHP version (e.g. v7.1):

    $ docker run -it --volumes-from arcanist php:7.1-cli /arc/arcanist/bin/arc --help

### Development

[Clone project](https://github.com/dkd/docker-dkdde-arcanist) and both Arcanist and libphutil sources into the project directory:

    $ git clone https://github.com/dkd/docker-dkdde-arcanist.git
    $ cd docker-dkdde-arcanist
    $ git clone https://github.com/phacility/arcanist.git
    $ git clone https://github.com/phacility/libphutil.git

Build image, tag appropriately and push to Docker Hub:

    $ docker build . --tag dkdde/arcanist
    $ docker push 
    $ docker push dkdde/arcanist
