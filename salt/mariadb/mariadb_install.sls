mariadb_install:
  pkg.installed:
  {% if grains['os_family'] == 'RedHat' %}
    - names:
      - mariadb-server
  {% endif %}
