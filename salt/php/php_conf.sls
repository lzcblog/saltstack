php_conf:
  file.managed:
    - name: /etc/php.ini
    - source: salt://php/conf/php.ini
    - user: root
    - group: root
    - mode: 644
