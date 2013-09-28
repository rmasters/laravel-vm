# laravel-vm

A recipe for building a development VM for working on Laravel and apps, written to [Taylor's demands][shopping-list]:

- PHP 5.5
- MySQL
- PostgreSQL
- Redis (w/web frontend)
- Memcached
- SQLite
- Beanstalkd (w/web frontend)

This uses Ansible to provison, but installs it on the guest machine [if your host is running Windows][ansible-windows].

[MIT licensed](LICENSE).

[shopping-list]: http://paste.laravel.com/V3q
[ansible-windows]: https://groups.google.com/d/msg/ansible-project/17YZIgArn2g/vY-QDVVUKusJ

