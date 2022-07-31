# Ruby On Speed

An open collection of Ruby benchmarks.

Ruby On Speed (ROS) allows you to run your Ruby code idioms in an elegant and reproducible way. It's based on the wonderful [Benchmark/Ips](https://github.com/evanphx/benchmark-ips) gem and provides an easy to use DSL to create the benchmark collection.

## List of Benchmarks

- [Array:compact](./benchmarks/array/compact_bench.rb) - remove any nil element from an Array
- [Array:concat](./benchmarks/array/concat_bench.rb) - concatenate two Arrays
- [Array:contains](./benchmarks/array/contains_bench.rb) - check if an Array contains an element
- [Array:contains_array](./benchmarks/array/contains_array_bench.rb) - test if all elements of an Array are included in another Array
- [Array:copy](./benchmarks/array/copy_bench.rb) - create a copy of an Array
- [Array:fill](./benchmarks/array/fill_bench.rb) - create an Array with Integers
- [Array:find_sorted](./benchmarks/array/find_sorted_bench.rb) - find first matching element of a sorted Array
- [Array:first](./benchmarks/array/first_bench.rb) - access the first element of an Array
- [Array:index](./benchmarks/array/index_bench.rb) - find the index of an Array element
- [Array:index_iterate](./benchmarks/array/index_iterate_bench.rb) - iterate over all elements of an Array
- [Array:iterate](./benchmarks/array/iterate_bench.rb) - iterate over all Array elements
- [Array:last](./benchmarks/array/last_bench.rb) - access the last element of an Array
- [Array:map](./benchmarks/array/map_bench.rb) - modify all elements of an Array
- [Array:map_some](./benchmarks/array/map_some_bench.rb) - modify
- [Array:min](./benchmarks/array/min_bench.rb) - find the lowest element of an Array
- [Array:pack](./benchmarks/array/pack_bench.rb) - pack a binary sequence
- [Array:sample](./benchmarks/array/sample_bench.rb) - get a random element of an Array
- [Array:size](./benchmarks/array/size_bench.rb) - get the count of Array entries
- [Array:unique](./benchmarks/array/uniq_bench.rb) - remove all duplicate from an Array
- [Date:distance](./benchmarks/date/distance_bench.rb) - calculate number of days between two dates
- [Float:from_string](./benchmarks/float/from_string_bench.rb) - convert a String to Float
- [Float:square](./benchmarks/float/square_bench.rb) - calculate the square of a Float
- [Float:zero](./benchmarks/float/zero_bench.rb) - test if a Float is zero
- [Hash:copy](./benchmarks/hash/copy_bench.rb) - create a copy of a Hash
- [Hash:from_array](./benchmarks/hash/from_array_bench.rb) - create an Hash from an Array
- [Hash:invalid_value](./benchmarks/hash/invalid_value_bench.rb) - find value of a non-existing key in a Hash
- [Hash:merge](./benchmarks/hash/merge_bench.rb) - merge two Hashes
- [Hash:store](./benchmarks/hash/store_bench.rb) - add a key/value pair to a Hash
- [Hash:symbolize](./benchmarks/hash/symbolize_bench.rb) - symbolize all keys of a Hash
- [Hash:value](./benchmarks/hash/value_bench.rb) - find value from a key
- [Integer:from_string](./benchmarks/integer/from_string_bench.rb) - convert a String to Integer
- [Integer:square](./benchmarks/integer/square_bench.rb) - calculate the square of a Integer
- [Integer:zero](./benchmarks/integer/zero_bench.rb) - test if an Integer is zero
- [Object:class](./benchmarks/object/class_bench.rb) - test if an Object is derived from a  Class
- [Proc:call](./benchmarks/proc/call_bench.rb) - call a Proc with parameters
- [Range:contains](./benchmarks/range/contains_bench.rb) - test if an item is in a Range
- [Range:rand](./benchmarks/range/rand_bench.rb) - get a random element of a Range
- [Range:to_a](./benchmarks/range/to_a_bench.rb) - convert a Range to an Array
- [Regexp:match](./benchmarks/regexp/const_bench.rb) - find Match of an Regexp
- [Ruby:CONST](./benchmarks/ruby/const_bench.rb) - using a constant
- [Ruby:accessor](./benchmarks/ruby/accessor_bench.rb) - access object member
- [Ruby:assign](./benchmarks/ruby/assign_bench.rb) - variable assignment
- [Ruby:block](./benchmarks/ruby/block_bench.rb) - call a block
- [Ruby:call](./benchmarks/ruby/call_bench.rb) - call a Proc/Lambda/Method
- [Ruby:forwarding](./benchmarks/ruby/forwarding_bench.rb) - forward a call
- [Ruby:if](./benchmarks/ruby/if_bench.rb) - if vs. ternary if vs. and
- [Ruby:loop](./benchmarks/ruby/loop_bench.rb) - different loops
- [Ruby:method_call](./benchmarks/ruby/method_call_bench.rb) - different method calls
- [Ruby:variable](./benchmarks/ruby/variable_bench.rb) - access a value
- [String: replace_first](./benchmarks/string/replace_first_bench.rb) - replace first sub string
- [String::format](./benchmarks/string/format_bench.rb) - format a Float with two digits
- [String:concat](./benchmarks/string/concat_bench.rb) - concat two Strings
- [String:contains](./benchmarks/string/contains_bench.rb) - test if a String contains another String
- [String:copy](./benchmarks/string/copy_bench.rb) - create a String copy
- [String:remove_char](./benchmarks/string/remove_char_bench.rb) - remove a single char
- [String:remove_chars](./benchmarks/string/remove_chars_bench.rb) - remove some chars
- [String:replace](./benchmarks/string/replace_bench.rb) - replace all sub strings
- [String:start](./benchmarks/string/start_bench.rb) - test if s String starts with a given String
- [String:unpack](./benchmarks/string/unpack_bench.rb) - Integers from binary String
- [Struct:access_cmp](./benchmarks/struct/access_cmp_bench.rb) - access Struct member vs. access Hash pairs
- [Struct:create_cmp](./benchmarks/struct/create_cmp_bench.rb) - create a Struct vs. create a Hash
- [Struct:member](./benchmarks/struct/member_bench.rb) - access the member of a Struct
