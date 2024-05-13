apache2:
  pkg.installed

/etc/apache2/sites-available/example.conf:
  file.managed:
    - source: "salt://apache/example.conf"
    - require:
      - pkg: apache2

/etc/apache2/sites-enabled/example.conf:
  file.symlink:
    - target: "/etc/apache2/sites-available/example.conf"
    - require:
      - pkg: apache2

/etc/apache2/sites-enabled/000-default.conf:
  file.absent

/etc/apache2/sites-available/000-default.conf:
  file.absent

/home/vagrant/examplewww/:
  file.directory:
    - user: vagrant
    - group: vagrant
    - mode: "0755"

/home/vagrant/examplewww/index.html:
  file.managed:
    - source: "salt://apache/index.html"

apache2.service:
  service.running:
    - watch:
      - file: /etc/apache2/sites-available/example.conf

