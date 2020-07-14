FROM php:7.3-apache
#install git
RUN  apt update \
     && apt install -y git 
RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN a2enmod rewrite
#install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=. --filename=composer
RUN mv composer /usr/local/bin/

COPY php-aws-codepipeline/ /var/www/html/
#WORKDIR /usr/src/myapp
EXPOSE 80
