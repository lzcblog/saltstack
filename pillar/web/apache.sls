{% if grains["os"] == "CentOS" %}
apache: httpd
{% elif grains["os"] == "Debian" %}
apache: apached
{% endif %}
