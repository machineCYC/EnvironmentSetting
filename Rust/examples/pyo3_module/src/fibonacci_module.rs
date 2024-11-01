use pyo3::prelude::*;
use pyo3::wrap_pyfunction;

// The Fibonacci function to be exposed
#[pyfunction]
pub fn fibonacci(n: u32) -> u32 {
    match n {
        0 => 0,
        1 => 1,
        _ => fibonacci(n - 1) + fibonacci(n - 2),
    }
}

// Create a Python module
#[pymodule]
fn fibonacci_module(py: Python, m: &PyModule) -> PyResult<()> {
    m.add_function(wrap_pyfunction!(fibonacci, m)?)?;
    Ok(())
}
