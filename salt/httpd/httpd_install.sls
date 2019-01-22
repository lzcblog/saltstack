httpd_install:
  pkg.installed:
  {% if grains['os_family'] == 'RedHat' %}
    - names:
      - httpd
  {% endif %}
