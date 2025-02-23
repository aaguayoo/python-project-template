![AIF](docs/img/bbva.png)

# {{cookiecutter.project_name.title()}}

## Author(s)

- {{cookiecutter.author}} [[{{cookiecutter.email}}](mailto:{{cookiecutter.email}})]

## Description

{{cookiecutter.description}}

## Project requirements

- [ ] MkDocs
  - [ ] Home
  - [ ] Design Document
  - [ ] Examples
  - [ ] Performance analysis and profile
  - [ ] API Reference
- [ ] Tests
  - [ ] [Code coverage (-%)](docs/coverage/index.html)
  - [ ] Unit tests
  - [ ] Feature tests
  - [ ] Integration tests
  - [ ] Performance tests
- [ ] Quality Assurance
  - [ ] Code covereage
  - [ ] Code quality
  - [ ] Code style
- [ ] Profiling
  - [ ] Execution time
  - [ ] Memory usage
  - [ ] CPU usage
- [ ] CI/CD 
  - [ ] Bitbucket actions
  - [ ] Jenkins
- [ ] Demo app
- [ ] Notebooks

---

## Install

With **Pip**:
```bash
pip install git+ssh://git@github.com:/{{cookiecutter.bitbucket_username}}/{{cookiecutter.bitbucket_reponame}}
```

With **Poetry**:
```bash
poetry add git+ssh://git@globaldevtools.bbva.com:7999/~{{cookiecutter.bitbucket_username}}/{{cookiecutter.bitbucket_reponame}}
```
