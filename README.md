# Projects for Marketing

![docker-compose.png](docker-compose.png)

## Description

These are projects for automating data loading into a single data storage system (sql database). 

The program runs on Ubuntu 20.04 or Ubuntu 22.04 operating systems.

## Installation

Use the [docker](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04) to run projects for this program.

![docker-image.png](docker-image.png)

```sh
git clone https://github.com/agladsoft/docker_project.git

git submodule init

git submodule update
```

or

```sh
git clone --recurse-submodules https://github.com/agladsoft/docker_project.git
```

Next

```sh
sudo docker-compose up
```

## Usage

To check that all projects are running, use the command

```sh
sudo docker container ls -a
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)