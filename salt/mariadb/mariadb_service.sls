mariadb_service:
  service.running:
    - name: mariadb
    - enable: True
    - reload: True
    - watch:
      - file: mariadb_conf
    - require:
      - pkg: mariadb_install
