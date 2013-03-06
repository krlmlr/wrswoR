
#include <Rcpp.h>
using namespace Rcpp;

struct Comp{
  Comp(const Rcpp::NumericVector& v ) : _v(v) {}
  bool operator ()(int a, int b) { return _v[a] < _v[b]; }
  const Rcpp::NumericVector& _v;
};

// [[Rcpp::export(sample.int.crank)]]
IntegerVector sample_int_crank(int n, int size, NumericVector prob) {
    Rcpp::NumericVector rnd = rexp(n) / prob;
    Rcpp::IntegerVector vx = Rcpp::clone<Rcpp::IntegerVector>(n);
    for (int i = 0; i<vx.size(); ++i) vx[i] = i;
    std::partial_sort(vx.begin(), vx.begin() + size, vx.end(), Comp(rnd));
    return vx[seq(0, size - 1)] + 1;
}
