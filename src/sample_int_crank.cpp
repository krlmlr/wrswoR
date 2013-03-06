
#include <Rcpp.h>
using namespace Rcpp;

struct Comp{
  Comp(const Rcpp::NumericVector& v ) : _v(v) {}
  bool operator ()(int a, int b) { return _v[a] < _v[b]; }
  const Rcpp::NumericVector& _v;
};

// [[Rcpp::export(sample.int.crank)]]
IntegerVector sample_int_crank(int n, int size, NumericVector prob) {
    int num = size, x = n;
    Rcpp::IntegerVector vx = Rcpp::clone<Rcpp::IntegerVector>(x);
    Rcpp::NumericVector pr = Rcpp::clone<Rcpp::NumericVector>(prob);
    Rcpp::NumericVector rnd = rexp(x) / pr;
    for (int i= 0; i<vx.size(); ++i) vx[i] = i;
    std::partial_sort(vx.begin(), vx.begin() + num, vx.end(), Comp(rnd));
    vx = vx[seq(0, num - 1)] + 1;
    return vx;
}
