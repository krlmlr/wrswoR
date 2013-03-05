
#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export(sample.int.crank)]]
IntegerVector sample_int_crank(int n, int size, NumericVector prob) {
    return IntegerVector(size);
}
