# set build environment
../../box-level-1/basebox-ubuntu-18.04-docker/set-build-env.ps1

# run packer for vagrant virtualbox provider
packer build packer-virtualbox.json
