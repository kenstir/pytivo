# pyTivo on QNAP

## Overview

This directory contains the structure necessary to create a QPKG for pyTivo that runs on a QNAP NAS.

## How to install a binary package

Follow the instructions at https://forum.qnap.com/viewtopic.php?f=320&t=125497

## How to build a QNAP package from sources

### One-time Setup

0. Install Entware-ng on your QNAP per the instructions at https://github.com/Entware-ng/Entware-ng/wiki

1. Download and install the QDK on your QNAP.  See https://wiki.qnap.com/wiki/QPKG_Development_Guidelines for links to the Download and documentation.

2. SSH to your QNAP as the admin user.

3. Create a QPKG environment.

```sh
cd `getcfg QDK Install_Path -f /etc/config/qpkg.conf`
git clone https://github.com/kenstir/pytivo.git pyTivo
cd pyTivo
```

### Build a QPKG

Run the make_qpkg script

```sh
./qnap/make_qpkg.sh
```

The make_qpkg script leaves a copy of the qpkg file in `/share/Download/`.

### Install your shiny new QPKG

Use the manual installer to upload the qpkg file from `/share/Download/`.
