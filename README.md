1. Run `./build_docker.sh` to get a linux build environment
2. Run `bazel run //:tar_builder` - panic
3. Run `bazel run --@io_bazel_rules_go//go/config:tags=netgo //:tar_builder` - no panic
4. Edit MODULE.bazel to set go version to 1.20.1,  `bazel run //:tar_builder` - no panic

