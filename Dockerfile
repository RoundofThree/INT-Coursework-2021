FROM ubuntu:18.04
#AUTHOR adam.green@kcl.ac.uk

RUN echo '\033[1;35mConfiguring settings for box\033[0m'
RUN apt-get update
RUN apt-get install -y --reinstall software-properties-common
RUN add-apt-repository universe
RUN mkdir /src && cd /src

RUN echo '\033[1;35mInstalling build tools\033[0m'
RUN apt-get update && apt-get -y install flex bison cmake build-essential mercurial python wget git


RUN echo '\033[1;35mBuilding POPF/OPTIC\033[0m'
RUN cd /src
RUN cd /src && wget https://downloads.sourceforge.net/project/tsgp/OPTIC/optic-patched-for-gcc8.tar.bz2
RUN cd /src && tar -jxf optic-patched-for-gcc8.tar.bz2
RUN cd /src/optic && apt-get update && apt-get install -y doxygen coinor-libcbc-dev coinor-libclp-dev coinor-libcoinutils-dev coinor-libosi-dev coinor-libcgl-dev libgsl-dev zlib1g-dev
RUN cd /src/optic && ./run-cmake-release
RUN cd /src/optic && ./build-release
RUN mv /src/optic/release/optic/optic-clp /bin/optic
	
RUN echo '\033[1;35mFinished building\033[0m'

CMD ./plan.sh