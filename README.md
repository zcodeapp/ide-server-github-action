# ZCode APP - IDE Server GitHub Action

## Usage



```
name: Run tests

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest

    - name: Start ZCode APP IDE Server
      uses: zcodeapp/ide-server-github-action@1.0.7
```