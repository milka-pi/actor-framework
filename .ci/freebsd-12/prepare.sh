#!/bin/sh

echo "Preparing FreeBSD environment"
sysctl hw.model hw.machine hw.ncpu
set -e
set -x

env ASSUME_ALWAYS_YES=YES pkg bootstrap
pkg install -y bash git cmake

# Make sure network tests fail early.
sysctl -w net.inet.tcp.blackhole=0
