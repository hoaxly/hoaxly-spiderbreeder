FROM scrapinghub/portia:latest

RUN set -xe \
    && apt-get update \
    && dpkg --configure -a \
    && apt-get install -f -y gcc \
                          python3-dev python-dev \
                          curl bash make build-essential
RUN set -xe \
    && apt-get install -f -y python-software-properties \
                             software-properties-common
#                            libtool xml-core libxml2-dev libxslt1-dev \
#                            libxml2 zlib1g-dev libffi-dev \


# the file with our requirements
COPY portia_projects/requirements.txt .
# our helper package
COPY portia_projects/packages /app/data/projects/packages
# our current spiders
COPY portia_projects/hoaxlyPortia /app/data/projects/hoaxlyPortia

# first some overrides to the parent container
#RUN pip install setuptools --upgrade
#RUN pip3 install scrapy
RUN pip3 install scrapyd
# RUN pip3 install lxml

# some tooling
RUN pip3 install scrapyd-client

# and our own requirements
RUN pip install -r requirements.txt
# finally our own helperPackage
RUN pip3 install -e /app/data/projects/packages

COPY ./scrapyd.conf /etc/scrapyd/
VOLUME /etc/scrapyd/ /var/lib/scrapyd/
EXPOSE 6800
