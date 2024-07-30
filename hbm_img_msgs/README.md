English| [简体中文](./README_cn.md)

Getting Started with hbm_img_msgs
=======


# Intro

The hbm_img_msgs package is a message package for shared memory development, used to define message structures for transmitting image data with resolutions below 1080P RGB24-bit, with a maximum data length of 1920*1080*3. NV12 can also be transmitted, and when reading data, it is read based on the encoding and data_size.

# Build

## Dependency

## Development Environment

- Programming Language: C/C++
- Development Platform: X3/X86
- System Version: Ubuntu 20.0.4
- Compilation Toolchain: Linux GCC 9.3.0/Linaro GCC 9.3.0

## Compilation

Supports compilation on X3 Ubuntu system and cross-compilation using docker on PC, and supports controlling the dependencies and functionalities of the compiled pkg through compilation options.

### Compilation on X3 Ubuntu System
1. Compilation Environment Confirmation

- ROS environment variables are set in the current compilation terminal: `source /opt/ros/foxy/setup.bash`.
- ROS2 compilation tool colcon is installed. If the installed ROS does not include the compilation tool colcon, it needs to be manually installed. colcon installation command: `apt update; apt install python3-colcon-common-extensions`

2. Compilation:
- `colcon build --packages-select hbm_img_msgs`

### Docker Cross-compilation
1. Compilation Environment Confirmation

- Compilation in docker with tros already installed. For docker installation, cross-compilation instructions, tros compilation, and deployment instructions, refer to the README.md in the robot development platform robot_dev_config repo.

2. Compilation

- Compilation command:

  ```
  export TARGET_ARCH=aarch64
  export TARGET_TRIPLE=aarch64-linux-gnu
  export CROSS_COMPILE=/usr/bin/$TARGET_TRIPLE-
  
  colcon build --packages-select hbm_img_msgs \
     --merge-install \
     --cmake-force-configure \
```--cmake-args \
     --no-warn-unused-cli \
     -DCMAKE_TOOLCHAIN_FILE=`pwd`/robot_dev_config/aarch64_toolchainfile.cmake
     
  ```


# Usage

After successful compilation, copy the generated install path to the RDK X3 development board (ignore the copy step if compiling on X3), and execute the following command to run:

```
export COLCON_CURRENT_PREFIX=./install
source ./install/local_setup.sh
// Header file path
#include "hbm_img_msgs/msg/hbm_msg1080_p.hpp"
```