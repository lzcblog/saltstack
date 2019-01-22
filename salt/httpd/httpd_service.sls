httpd_service:
  service.running:
    - name: httpd
    - enable: True
    - reload: True
    - watch:
      - file: httpd_conf
    - require:
      - pkg: httpd_install
