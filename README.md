# Jenkins Docker Automation

This project helps automate the Docker installation of Jenkins as outlined in the [Jenkins documentation](https://www.jenkins.io/doc/book/installing/docker/).

## Usage

To start Jenkins with Docker, use the following commands:

### Start Jenkins Docker

```sh
make jenkins-docker
```

### Start Jenkins Blue Ocean
```sh
make jenkins-blue
```

### Clean Volume
```sh
make clean-jenkins-data
```