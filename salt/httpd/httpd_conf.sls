httpd_conf:
  file.managed:
    - name: /etc/httpd/conf/httpd.conf
    - source: salt://httpd/conf/httpd.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
      PORT: 88
