FROM nginx

MAINTAINER Alexis Horgix Chotard <alexis.horgix.chotard@gmail.com>

COPY images/ /usr/share/nginx/html/images
COPY reveal.js/ /usr/share/nginx/html/reveal.js
COPY slides.html /usr/share/nginx/html/index.html
