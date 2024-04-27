# SIMD
One of the topcis I chose for the Advanced Programming Concepts course. 
The code and directory structure used in the written part of this assignment do slightly differ from what is used in the actual project because I wanted to make the code easier to understand.
The written part doesn't cover the function that performs the dot product due to time constraints.

In this project I'm optimizing the execution speed of functions by utilizing Single Instruction Multiple Data (SIMD). 
I've used AVX and AVX2, which are SIMD instruction sets for the x86_64 architecture.
To measure the performance difference I used the Google Benchmark library.
More information about SIMD and the results can be found in the `written` directory.
