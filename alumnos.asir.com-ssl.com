<VirtualHost *:443>
    ServerName alumnos.asir.com
    DocumentRoot /var/www/alumnos.asir.com

    SSLEngine on
    SSLCertificateFile /etc/apache2/ssl/alumnos.asir.com.crt
    SSLCertificateKeyFile /etc/apache2/ssl/alumnos.asir.com.key

    <Directory "/var/www/alumnos.asir.com">
        AuthType Basic
        AuthName "Acceso restringido"
        AuthUserFile /etc/apache2/.htpasswd
        Require valid-user
    </Directory>
</VirtualHost>
