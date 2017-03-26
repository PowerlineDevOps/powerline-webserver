{% set php_ver = salt['pillar.get']('civix:php:version') -%}

install-php-pkgs:
  pkg.installed:
    - pkgs:
      - php{{php_ver}}
      - php{{php_ver}}-common
      - php{{php_ver}}-cli
      - php{{php_ver}}-curl
      - php{{php_ver}}-gd
      - php{{php_ver}}-mysql
      - php{{php_ver}}-sqlite3
      - php{{php_ver}}-intl
    - skip_verify: True

{% if php_ver == '7.0' %}
install-extra-php7-pkgs:
  pkg.installed:
    - pkgs:
      - php{{php_ver}}-bcmath
      - php{{php_ver}}-xml
      - php{{php_ver}}-mbstring
    - skip_verify: True

{% endif %}
