# sample_int_rej emits an otel span with parameter and result attributes

    Code
      recorder$spans
    Output
      [[1]]
      [[1]]$name
      [1] ".sample_int_rej"
      
      [[1]]$attributes
      [[1]]$attributes$n
      [1] 6
      
      [[1]]$attributes$size
      [1] 3
      
      [[1]]$attributes$prob_length
      [1] 6
      
      [[1]]$attributes$wr.size
      [1] 4
      
      [[1]]$attributes$wr.sample.len
      [1] 1
      
      
      
      [[2]]
      [[2]]$name
      [1] ".sample_int_rej"
      
      [[2]]$attributes
      [[2]]$attributes$n
      [1] 5
      
      [[2]]$attributes$size
      [1] 2
      
      [[2]]$attributes$prob_length
      [1] 5
      
      [[2]]$attributes$wr.size
      [1] 3
      
      [[2]]$attributes$wr.sample.len
      [1] 2
      
      
      

# sample_int_rej recurses and emits one span per recursion

    Code
      lapply(recorder$spans, function(s) {
        list(name = s$name, attribute_keys = sort(names(s$attributes)))
      })
    Output
      [[1]]
      [[1]]$name
      [1] ".sample_int_rej"
      
      [[1]]$attribute_keys
      [1] "n"             "prob_length"   "size"          "wr.sample.len"
      [5] "wr.size"      
      
      
      [[2]]
      [[2]]$name
      [1] ".sample_int_rej"
      
      [[2]]$attribute_keys
      [1] "n"             "prob_length"   "size"          "wr.sample.len"
      [5] "wr.size"      
      
      
      [[3]]
      [[3]]$name
      [1] ".sample_int_rej"
      
      [[3]]$attribute_keys
      [1] "n"             "prob_length"   "size"          "wr.sample.len"
      [5] "wr.size"      
      
      
      [[4]]
      [[4]]$name
      [1] ".sample_int_rej"
      
      [[4]]$attribute_keys
      [1] "n"             "prob_length"   "size"          "wr.sample.len"
      [5] "wr.size"      
      
      

