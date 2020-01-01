# lambda-packer

> Let's pack things up.

## What is this?

This is a tool for packaging and building lambda functions in a live-like environment. Just like it's [built upon the lambci/docker-lambda](https://github.com/lambci/docker-lambda), which means it's as close as one can possibly come to the native lambda environment.

## So, how do I use it?

Step by step:

1.  Make sure there is code with a `requirements.txt` file
2.  Run the image `lambda-packer` while mounting in the code to `/app/src` and an output folder to `/packages` where the zipped package will eventually land. Pass in the name of the package as the _command_ (parameter after the docker image). To use  pypi repository, pass in the variables `PYPI_USERNAME` and `PYPI_PASSWORD`
3.  Ship it!

_In code please!_

```bash
# The application code lies in `/handlers` (together with the requirements.txt)
# The package will land in ${PWD}/packages and it will be called custom_package_name.zip

# To run the below script, the comments must be removed

docker run --rm -it \
  -v "${PWD}/example_handlers:/app/src" \             # Path to the code
  -v "${PWD}/packages:/packages" \                    # Path to package output
  -e PYPI_USERNAME -e PYPI_PASSWORD \ #  pypi credentials
  lambda-packer \
  custom_package_name.zip                             # Name of the package
```
