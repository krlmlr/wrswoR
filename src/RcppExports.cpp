// Generated by using Rcpp::compileAttributes() -> do not edit by hand
// Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

#include <Rcpp.h>

using namespace Rcpp;

#ifdef RCPP_USE_GLOBAL_ROSTREAM
Rcpp::Rostream<true>&  Rcpp::Rcout = Rcpp::Rcpp_cout_get();
Rcpp::Rostream<false>& Rcpp::Rcerr = Rcpp::Rcpp_cerr_get();
#endif

// sample_int_crank
IntegerVector sample_int_crank(int n, int size, NumericVector prob);
RcppExport SEXP _wrswoR_sample_int_crank(SEXP nSEXP, SEXP sizeSEXP, SEXP probSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< int >::type n(nSEXP);
    Rcpp::traits::input_parameter< int >::type size(sizeSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type prob(probSEXP);
    rcpp_result_gen = Rcpp::wrap(sample_int_crank(n, size, prob));
    return rcpp_result_gen;
END_RCPP
}
// sample_int_ccrank
SEXP sample_int_ccrank(int n, int size, NumericVector prob);
RcppExport SEXP _wrswoR_sample_int_ccrank(SEXP nSEXP, SEXP sizeSEXP, SEXP probSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< int >::type n(nSEXP);
    Rcpp::traits::input_parameter< int >::type size(sizeSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type prob(probSEXP);
    rcpp_result_gen = Rcpp::wrap(sample_int_ccrank(n, size, prob));
    return rcpp_result_gen;
END_RCPP
}
// sample_int_expj
IntegerVector sample_int_expj(int n, int size, NumericVector prob);
RcppExport SEXP _wrswoR_sample_int_expj(SEXP nSEXP, SEXP sizeSEXP, SEXP probSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< int >::type n(nSEXP);
    Rcpp::traits::input_parameter< int >::type size(sizeSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type prob(probSEXP);
    rcpp_result_gen = Rcpp::wrap(sample_int_expj(n, size, prob));
    return rcpp_result_gen;
END_RCPP
}
// sample_int_expjs
IntegerVector sample_int_expjs(int n, int size, NumericVector prob);
RcppExport SEXP _wrswoR_sample_int_expjs(SEXP nSEXP, SEXP sizeSEXP, SEXP probSEXP) {
BEGIN_RCPP
    Rcpp::RObject rcpp_result_gen;
    Rcpp::RNGScope rcpp_rngScope_gen;
    Rcpp::traits::input_parameter< int >::type n(nSEXP);
    Rcpp::traits::input_parameter< int >::type size(sizeSEXP);
    Rcpp::traits::input_parameter< NumericVector >::type prob(probSEXP);
    rcpp_result_gen = Rcpp::wrap(sample_int_expjs(n, size, prob));
    return rcpp_result_gen;
END_RCPP
}

static const R_CallMethodDef CallEntries[] = {
    {"_wrswoR_sample_int_crank", (DL_FUNC) &_wrswoR_sample_int_crank, 3},
    {"_wrswoR_sample_int_ccrank", (DL_FUNC) &_wrswoR_sample_int_ccrank, 3},
    {"_wrswoR_sample_int_expj", (DL_FUNC) &_wrswoR_sample_int_expj, 3},
    {"_wrswoR_sample_int_expjs", (DL_FUNC) &_wrswoR_sample_int_expjs, 3},
    {NULL, NULL, 0}
};

RcppExport void R_init_wrswoR(DllInfo *dll) {
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
