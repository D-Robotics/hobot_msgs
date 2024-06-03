# Copyright (c) 2024，Horizon Robotics.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#  抓取组信息

# 置信度
float32 score

# 宽度
float32 width

# 高度
float32 height

# 深度
float32 depth

# 旋转矩阵
float32[] rotation

# 变化矩阵
float32[] translation

# 目标id
int32 object_id