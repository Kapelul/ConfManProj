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

/home/vagrant/examplewww/index.html:
  file.managed:
    - source: "salt://apache/index.html

apache2.service:
  service.running
