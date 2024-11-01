import ctypes

# Load the shared library
cpp_lib = ctypes.CDLL("/mnt/d/workspace/EnvironmentSetting/Rust/example/libfibonacci/target/release/liblibfibonacci.so")
cpp_fibonacci = cpp_lib.fibonacci
cpp_fibonacci.argtypes = [ctypes.c_int]
cpp_fibonacci.restype = ctypes.c_int

# Running the function
print(cpp_fibonacci(40))
