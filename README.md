# Master_test_data
This is a repository to store the raw test data.

Raw data is stored respective folders for the different tests.

All plotting scripts are written in MATLAB.

## Types of Tests

Generally, there are 3 types of tests:

- **1 Column Tests**:
  - Measure: Nanoseconds of execution time

- **2 Column Tests**:
  - Purpose: Convergence test for ICP (Iterative Closest Point)
  - 1st row: Number of points
  - last row: Convergence time in milliseconds
  - 1st Column: Mean rotational error[deg]
  - 2nd Column: Mean translational error[m]


- **3 Column Tests**:
  - 1st Column: Amps
  - 2nd Column: Volts
  - 3rd Column: Sample time in milliseconds
