Webdev Scaffold
===

Get it
---
```sh
git clone https://github.com/gogamatic/blank.git PROJECT
cd PROJECT
```

Setup
---
```sh
git remote rename origin blank
sh init
```

Add to existing [`blank`]() project
---
```sh
git remote add blank https://github.com/gogamatic/blank.git
git pull blank workflow
```

Use
---

```sh
git checkout dev
npm install
```
Do your work on `dev` branch

Release
---

```sh
git checkout workflow
sh release base dev master
```

Templates
---
* [`base-node`](./templates/base-node)
* [`dev-node`](./templates/dev-node)
* [`web-base-node`](/templates/web-base-node)
* [`web-dev-node`](/templates/web-dev-node)

License
---
[MIT](LICENSE)
