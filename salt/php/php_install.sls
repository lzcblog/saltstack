php_install:
  pkg.installed:
  {% if grains['os_family'] == 'RedHat' %}
    - names:
      - php
      - php-mysql
  {% endif %}
