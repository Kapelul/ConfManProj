apache2:
  pkg.installed

/etc/apache2/sites-available/example.conf:
  file.managed:
    - source: "salt://apache/example.conf"

/etc/apache2/sites-enabled/example.conf:
  file.symlink:
    - target: "/etc/apache2/sites-available/example.conf"

/etc/apache/sites-enabled/000-default.conf:
  file.absent

apache2.service:
  service.running
