# 🔮 Projects for Marketing

![docker-compose.png](docker-compose.png)

## 📡 Description

These are projects for automating data loading into a single data storage system (sql database). 

The program runs on Ubuntu 20.04 or Ubuntu 22.04 operating systems.

## 📜 Installation

![docker-image.png](docker-image.png)

Use the [docker](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04) to run projects for this program.


```sh
git clone https://github.com/agladsoft/docker_project.git

git submodule init

git submodule update
```

or

```sh
git clone --recurse-submodules https://github.com/agladsoft/docker_project.git
```

## 💻 Get started

To start all containers use the command

```sh
sudo docker-compose up
```

To delete all containers use the command

```sh
sudo docker-compose down
```

To launch a single container, use the command

```sh
sudo docker-compose up `container_name`
```

To delete one container, use the command

```sh
sudo docker-compose stop `container_name`
sudo docker-compose rm `container_name`
```

To restart one container, use the command

```sh
sudo docker-compose restart `container_name`
```

To recreate one container, use the command

```sh
sudo docker-compose up --force-recreate --no-deps --build `container_name`
```

## 🙇‍♂️ Usage

To check that all projects are running, use the command

```sh
sudo docker container ls -a
```

## 👋 Contributing

Please check out the [Contributing to RATH guide](https://docs.kanaries.net/community/contribution-guide)
for guidelines about how to proceed.

Thanks to all contributors :heart:

<a href="https://github.com/agladsoft/docker_project/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=agladsoft/docker_project" />
</a>

## ⚖️ License
![alt text](https://seeklogo.com/images/M/MIT-logo-73A348B3DB-seeklogo.com.png)

This project is under the MIT License. See the [LICENSE](https://github.com/gogs/gogs/blob/main/LICENSE) file for the full license text.