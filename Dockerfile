FROM yiisoftware/yii2-php:7.3-apache
ADD advanced /app/web/
RUN chmod 777 -R /app/web/assets
RUN sed -i "s/localhost/mysql.demo.svc.cluster.locali/g" /app/web/common/config/main-local.php
RUN sed -i "s/root/mai/g" /app/web/common/config/main-local.php
RUN composer update
RUN php init --env=Development --overwrite=n
#RUN /usr/libexec/s2i/assemble

# Set the default command for the resulting image
#CMD /usr/libexec/s2i/run
