Webdev Scaffold
===

Prepare
---
```
proj="YOUR-PROJECT-NAME"
```

Setup
---
```sh
git clone https://github.com/gogamatic/blank.git $proj
cd $proj
git remote rename origin blank
sh init
```

Add to existing [`blank`]() project
---
```sh
cd $proj
git remote add blank https://github.com/gogamatic/blank.git
git pull blank workflow
```

Use
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

Templates
---
* [`base-node`](./templates/base-node)
* [`dev-node`](./templates/dev-node)

License
---
[MIT](LICENSE)
