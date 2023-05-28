#!/usr/bin/env sh

set -e
set -o errexit
set -o nounset

usage() {
  printf "CI Start Container\n"

  printf "Usage: entrypoint.sh "
  printf -- "[-i <image name>] "
  printf -- "[-r <image version>] "
  printf -- "[-c <container name>] "
  printf -- "[-e <env>] "
  printf -- "[-h] "
  printf -- "[-v] "
  printf "\n"

  printf "  -%s\t%s - %s%s\n" "i" "image" "Image name" ""
  printf "  -%s\t%s - %s%s\n" "r" "imageversion" "Image version" ""
  printf "  -%s\t%s - %s%s\n" "c" "container" "Container name" ""
  printf "  -%s\t%s - %s%s\n" "h" "help" "Show this help message." ""
  printf "  -%s\t%s - %s%s\n" "v" "version" "Show version information." ""
  printf "  -%s\t%s - %s%s\n" "e" "env" "Environment" " (default: dev)"
}

version() {
  printf "0.0.1\n"
}

# default values
opt_help="false"
opt_version="false"
opt_env="development"
opt_image="zcodeapp/ide-server"
opt_imageversion="latest"
opt_container="test_container"

# declared functions

# option parsing
OPTSPEC=:hvi:e:c:mip
while getopts $OPTSPEC option; do
  case "$option" in
    h ) opt_help="true"; usage; exit 0  ;;
    v ) opt_version="true"; version; exit 0  ;;
    e ) opt_env=$OPTARG;  ;;
    i ) opt_image=$OPTARG;  ;;
    r ) opt_imageversion=$OPTARG;  ;;
    c ) opt_container=$OPTARG;  ;;
   \? ) echo "Unknown option: -$OPTARG" >&2; exit 1;;
    : ) echo "Missing option argument for -$OPTARG" >&2; exit 1;;
    * ) echo "Unimplemented option: -$OPTARG" >&2; exit 1;;
  esac
done
shift $((OPTIND - 1))

# required option validation
if [ -z "$opt_env" ] ; then
  usage
  exit 1
fi
if [ -z "$opt_container" ] ; then
  usage
  exit 1
fi
if [ -z "$opt_image" ] ; then
  usage
  exit 1
fi
if [ -z "$opt_imageversion" ] ; then
  usage
  exit 1
fi
docker run --detach --publish=4000:4000 --name=$opt_container $opt_image:$opt_imageversion
sleep 5 # wait container start
echo "Success run container [$opt_container - $opt_image:$opt_imageversion]"