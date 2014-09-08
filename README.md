Webdev Scaffold
===

Setup
---

```sh
proj=foo
git clone https://github.com/gogamatic/blank.git $proj
cd $proj
git remote rename origin blank
sh init
```

Usage
---

Do your work on `dev` branch

```sh
cd $proj
git checkout dev
```

Release
---

```sh
cd $proj
git checkout workflow
sh release base dev master
```

License
---
[MIT](LICENSE)
