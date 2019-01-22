lamp-install:
  pkg.installed:
  {% if grains['os_family'] == 'RedHat' %}
    - names:
      - httpd
      - php
      - mariadb-server
      - php-mysql
  {% endif %}

httpd-conf:
  file.managed:
    - name: /etc/httpd/conf/httpd.conf
    - source: salt://lamp/files/httpd.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
      PORT: 880

php-conf:
  file.managed:
    - name: /etc/php.ini
    - source: salt://lamp/files/php.ini
    - user: root
    - group: root
    - mode: 644

mariadb-conf:
  file.managed:
    - name: /etc/my.cnf
    - source: salt://lamp/files/my.cnf
    - user: root
    - group: root
    - mode: 644

httpd-service:
  service.running:
    - name: httpd
    - enable: True
    - reload: True
    - watch:
      - file: httpd-conf
      - file: php-conf
    - require:
      - pkg: lamp-install

mariadb-service:
  service.running:
    - name: mariadb
    - enable: True
    - reload: True
    - watch:
      - file: mariadb-conf
    - require:
      - pkg: lamp-install

test-page-php:
  file.managed:
  - name: /var/www/html/index.php
  - source: salt://lamp/files/index.php
  - user: root
  - group: root
  - mode: 644

test-page-mariadb:
  file.managed:
  - name: /var/www/html/mariadb.php
  - source: salt://lamp/files/mariadb.php
  - user: root
  - group: root
  - mode: 644


