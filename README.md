## About

This repository contains data for the csb.bmc.uu.se `mkdocs` website.  

## How to use on CSB

```bash
su - website
cd csb_website

# modify mkdocs.yml, docs/*
mkdocs build

# update repository
git add .
git commit -m "I hacked the website"
git push
```


## Installing locally

```bash
pip install -r requirements.txt
```

