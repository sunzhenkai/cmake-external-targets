Dependencies
```shell
cmake >= 3.24
```
# Usage

# Trouble Shooting
## extract package failed (tar)
### message
```shell
CMake Error: Problem with archive_read_next_header(): Pathname can't be converted from UTF-8 to current locale.
CMake Error: Problem extracting tar: /tmp/cpp-external-prefix/boost/src/boost-submodule-boost-1.80.0.tar.gz
```
### Solve
设置环境变量 LANG 为 UTF-8 字符集
```shell
export LANG=en_US.UTF-8
```

# Reference
- 推荐尝试 [vcpkg](https://github.com/microsoft/vcpkg)