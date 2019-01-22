mariadb_conf:
  file.managed:
    - name: /etc/my.cnf
    - source: salt://mariadb/conf/my.cnf
    - user: root
    - group: root
    - mode: 644
