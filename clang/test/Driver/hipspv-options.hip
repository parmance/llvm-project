// REQUIRES: clang-driver
// REQUIRES: x86-registered-target
// UNSUPPORTED: system-windows

// RUN: %clang -### -target x86_64-linux-gnu --offload=spirv64 \
// RUN:   --hip-path=%S/Inputs/hipspv -nogpuinc -nogpulib %s \
// RUN:   --spirv-use-llc=/foo/bar/llc 2>&1 | FileCheck %s

// CHECK-NOT: llvm-spirv
// CHECK: "/foo/bar/llc" "--mattr=+spirv1.1" "--filetype=obj" "{{.*}}.bc"
// CHECK-SAME: "-o" "{{.*}}.out"

