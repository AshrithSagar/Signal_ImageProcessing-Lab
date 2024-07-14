# Experiment - 1

## Functions

### `stem`

`stem(X,Y)` plots the data sequence, `Y`, at values specified by `X`. The `X` and `Y` inputs must be vectors or matrices of the same size. Additionally, `X` can be a row or column vector and `Y` must be a matrix with `length(X)` rows.

- If `X` and `Y` are both vectors, then `stem` plots entries in `Y` against corresponding entries in `X`.
- If `X` is a vector and `Y` is a matrix, then `stem` plots each column of `Y` against the set of values specified by `X`, such that all elements in a row of `Y` are plotted against the same value.
- If `X` and `Y` are both matrices, then `stem` plots columns of `Y` against corresponding columns of `X`.

### `plot`

`plot(X,Y)` creates a 2-D line plot of the data in `Y` versus the corresponding values in `X`.

### `abs`

`Y = abs(X)` returns the absolute value of each element in array `X`.

If `X` is complex, `abs(X)` returns the complex magnitude.

### `angle`

`theta = angle(z)` returns the phase angle in the interval [-*π*,*π*] for each element of a complex array `z`. The angles in `theta` are such that `z = abs(z).*exp(i*theta)`.


### `real`

`X = real(Z)` returns the real part of each element in array `Z`.

### `imag`

`Y = imag(Z)` returns the imaginary part of each element in array `Z`.

### `rand`

Uniformly distributed random numbers.

`X = rand(n)` returns an `n`-by-`n` matrix of uniformly distributed random numbers.
