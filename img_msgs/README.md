English| [简体中文](./README_cn.md)

Getting Started with img_msgs
=======


# Intro

The `img_msgs` package is a message package for h264/h265 development, used for transmitting h264/h265 frames.
The messages include:
1. uint32 index

   Frame sequence number

2. uint8[12] encoding

   Identifier for h264/h265

3. uint32 height

   Image height

4. uint32 width

   Image width

5. `builtin_interfaces/Time dts`

   Decoding timestamp

6. `builtin_interfaces/Time pts`

   Presentation timestamp

7. uint8[] data

   Frame content, including NAL header, 00 00 00 01/00 00 01

# Build

## Dependency

## Development Environment

- Programming Language: C/C++
- Development Platform: X3/X86
- System Version: Ubuntu 20.0.4
- Compilation Toolchain: Linux GCC 9.3.0/Linaro GCC 9.3.0

## Compilation

Supports compilation on X3 Ubuntu system and cross-compilation using Docker on PC, with the ability to control package dependencies and functionalities through compilation options.### Compilation on X3 Ubuntu System
1. Compilation Environment Verification

- ROS environment variable is set in the current compilation terminal: `source /opt/ros/foxy/setup.bash`.
- ROS2 compilation tool colcon is installed. If the installed ROS does not include the colcon compilation tool, it needs to be manually installed. Installation command for colcon: `apt update; apt install python3-colcon-common-extensions`.

2. Compilation:
- `colcon build --packages-select img_msgs`

### Cross-compilation with Docker
1. Compilation Environment Verification

- Compilation within docker, and tros is already installed in the docker. For docker installation, cross-compilation explanation, tros compilation, and deployment instructions, please refer to the README.md file in the robot development platform robot_dev_config repository.

2. Compilation

- Compilation command:

  ```
  export TARGET_ARCH=aarch64
  export TARGET_TRIPLE=aarch64-linux-gnu
  export CROSS_COMPILE=/usr/bin/$TARGET_TRIPLE-
  
  colcon build --packages-select img_msgs \
     --merge-install \
     --cmake-force-configure \
     --cmake-args \
     --no-warn-unused-cli \
     -DCMAKE_TOOLCHAIN_FILE=`pwd`/robot_dev_config/aarch64_toolchainfile.cmake
     
  ```

# Usage

After successful compilation, copy the generated install path to the RDK X3 development board (if compiling on X3, ignore the copying step), and execute the following command to run:

```
export COLCON_CURRENT_PREFIX=./install
source ./install/local_setup.sh
// Header file path
#include "img_msgs/msg/h26_x_frame.hpp"
```