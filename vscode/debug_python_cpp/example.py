import ctypes

# 加載共享庫
example = ctypes.CDLL('./libexample.so')

# 設定函數原型
example.add.argtypes = [ctypes.c_int, ctypes.c_int]
example.add.restype = ctypes.c_int

example.subtract.argtypes = [ctypes.c_int, ctypes.c_int]
example.subtract.restype = ctypes.c_int

# 測試調用
a, b = 10, 5
print(f"{a} + {b} = {example.add(a, b)}")
print(f"{a} - {b} = {example.subtract(a, b)}")
