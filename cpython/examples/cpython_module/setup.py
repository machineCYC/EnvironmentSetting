from setuptools import setup, Extension

module = Extension('fibonacci_module', sources=['fibonacci_module.cpp'])

setup(name='fibonacci_module',
      version='1.0',
      description='Fibonacci module written in C',
      ext_modules=[module])
