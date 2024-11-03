#include <Python.h>

extern "C" int fibonacci(int n) {
    if (n <= 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
}

// Wrapper function to expose to Python
static PyObject* fibonacci_wrapper(PyObject* self, PyObject* args) {
    int n;
    // Parse the single integer argument
    if (!PyArg_ParseTuple(args, "i", &n)) {
        return NULL;  // Return NULL to indicate parsing failure
    }
    int result = fibonacci(n);
    // Return the result as a Python integer object
    return PyLong_FromLong(result);
}

// Method definition table for the module
static PyMethodDef FibonacciMethods[] = {
    {"fibonacci", fibonacci_wrapper, METH_VARARGS, "Calculate the nth Fibonacci number"},
    {NULL, NULL, 0, NULL}  // Sentinel value to indicate the end
};

// Module definition
static struct PyModuleDef fibonacci_module = {
    PyModuleDef_HEAD_INIT,
    "fibonacci_module",  // Module name
    "A module to calculate Fibonacci numbers using C++",  // Module documentation
    -1,  // Size of per-interpreter state of the module, or -1 if module keeps state in global variables.
    FibonacciMethods
};

// Module initialization function
PyMODINIT_FUNC PyInit_fibonacci_module(void) {
    return PyModule_Create(&fibonacci_module);
}
