
#include <Rcpp.h>
using namespace Rcpp;

struct Comp{
  Comp(const Rcpp::NumericVector& v ) : _v(v) {}
  // Inverted comparison!
  bool operator ()(int a, int b) { return _v[a] > _v[b]; }
  const Rcpp::NumericVector& _v;
};

template <class T>
T _add_one(T t) { return t + 1; }

// [[Rcpp::export(sample.int.crank)]]
IntegerVector sample_int_crank(int n, int size, NumericVector prob) {
  NumericVector rnd = prob / rexp(n);
  IntegerVector vx = seq(0, n - 1);
  std::partial_sort(vx.begin(), vx.begin() + size, vx.end(), Comp(rnd));
  
  // Initialize with elements vx[1:size], applying transform "+ 1"
  return IntegerVector(vx.begin(), vx.begin() + size, &_add_one<int>);
}
