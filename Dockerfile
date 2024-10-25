
FROM nginx:latest

# Installer package linux file
RUN apt-get update && apt-get install -y file

# Supprimer la configuration par défaut de Nginx
#RUN rm /usr/local/etc/nginx/nginx.conf

RUN mkdir -p /var/concentration/html

# Copier notre config specifique Nginx
#COPY conf/nginx.conf /usr/local/etc/nginx/nginx.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY html/ /var/concentration/html/

# Exposer le port 80
EXPOSE 80

# Démarrer Nginx
#CMD ["nginx", "-c", "/etc/nginx/nginx.conf"]
CMD ["nginx", "-g", "daemon off;"]
