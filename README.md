# Ruby On Speed

An open collection of Ruby benchmarks.

Ruby On Speed (ROS) allows you to run your Ruby code idioms in an elegant and reproducible way. It's based on the wonderful [Benchmark/Ips](https://github.com/evanphx/benchmark-ips) gem and provides an easy to use DSL to create the benchmark collection.

## Usage

### Get Help

```shell
./bin/ros help
```

### List All Benchmarks

```shell
./bin/ros list
```

### Test All Benchmarks

```shell
./bin/ros test
```

### Run All Benchmarks

```shell
./bin/ros run
```

## List of Benchmarks

- [Array:combine](./benchmarks/array/combine_bench.rb) - create an combined Array
- [Array:compact](./benchmarks/array/compact_bench.rb) - remove all nil elements from an Array
- [Array:concat](./benchmarks/array/concat_bench.rb) - concatenate two Arrays
- [Array:contains](./benchmarks/array/contains_bench.rb) - check if an Array contains an element
- [Array:contains_array](./benchmarks/array/contains_array_bench.rb) - Array elements included in another Array
- [Array:copy](./benchmarks/array/copy_bench.rb) - create a copy of an Array
- [Array:fill](./benchmarks/array/fill_bench.rb) - create an Array with Integers
- [Array:find_sorted](./benchmarks/array/find_sorted_bench.rb) - find element in a sorted Array
- [Array:first](./benchmarks/array/first_bench.rb) - access the first element of an Array
- [Array:index](./benchmarks/array/index_bench.rb) - find the index of an Array element
- [Array:index_iterate](./benchmarks/array/index_iterate_bench.rb) - iterate all elements
- [Array:iterate](./benchmarks/array/iterate_bench.rb) - iterate over all Array elements
- [Array:last](./benchmarks/array/last_bench.rb) - access the last element of an Array
- [Array:map](./benchmarks/array/map_bench.rb) - modify all elements of an Array
- [Array:map_some](./benchmarks/array/map_some_bench.rb) - modify
- [Array:min](./benchmarks/array/min_bench.rb) - find the lowest element of an Array
- [Array:pack](./benchmarks/array/pack_bench.rb) - pack a binary sequence
- [Array:sample](./benchmarks/array/sample_bench.rb) - get a random element of an Array
- [Array:size](./benchmarks/array/size_bench.rb) - get the count of Array entries
- [Array:unique](./benchmarks/array/uniq_bench.rb) - remove all duplicates from an Array
- [Boolean:assign](./benchmarks/boolean/assign_bench.rb) - assign value
- [Date:distance](./benchmarks/date/distance_bench.rb) - calculate number of days between two dates
- [Float:const](./benchmarks/float/consts_bench.rb) - float constants
- [Float:from_string](./benchmarks/float/from_string_bench.rb) - convert a String to Float
- [Float:square](./benchmarks/float/square_bench.rb) - calculate the square of a Float
- [Float:zero](./benchmarks/float/zero_bench.rb) - test if a Float is zero
- [Hash:access](./benchmarks/hash/access_bench.rb) - get values of Hash in Hash
- [Hash:copy](./benchmarks/hash/copy_bench.rb) - create a copy of a Hash
- [Hash:from_array](./benchmarks/hash/from_array_bench.rb) - create an Hash from an Array
- [Hash:invalid_value](./benchmarks/hash/invalid_value_bench.rb) - find non-existing value of Hash
- [Hash:merge](./benchmarks/hash/merge_bench.rb) - merge two Hashes
- [Hash:store](./benchmarks/hash/store_bench.rb) - add a key/value pair to a Hash
- [Hash:symbolize](./benchmarks/hash/symbolize_bench.rb) - symbolize all keys of a Hash
- [Hash:value](./benchmarks/hash/value_bench.rb) - find value from a key
- [Integer:from_string](./benchmarks/integer/from_string_bench.rb) - convert a String to Integer
- [Integer:min_max](./benchmarks/integer/min_max_bench.rb) - find min and max
- [Integer:square](./benchmarks/integer/square_bench.rb) - calculate the square of a Integer
- [Integer:zero](./benchmarks/integer/zero_bench.rb) - test if an Integer is zero
- [Object:class](./benchmarks/object/class_bench.rb) - test if an Object is derived from a Class
- [Object:method_argument](./benchmarks/ruby/argument_bench.rb) - test (default) arguments
- [Object:respond_to](./benchmarks/object/respond_to_bench.rb) - test if object responds to
- [Proc:call](./benchmarks/proc/call_bench.rb) - call a Proc with parameters
- [Proc:to_proc](./benchmarks/proc/to_proc_bench.rb) - to_proc vs. call
- [Range:comparison](./benchmarks/range/comparison_bench.rb) - is a Comparable in a Range
- [Range:rand](./benchmarks/range/rand_bench.rb) - get a random element of a Range
- [Range:to_a](./benchmarks/range/to_a_bench.rb) - convert a Range to an Array
- [Regexp:match](./benchmarks/regexp/const_bench.rb) - find Match of an Regexp
- [Ruby:CONST](./benchmarks/ruby/const_bench.rb) - using a constant
- [Ruby:accessor](./benchmarks/ruby/accessor_bench.rb) - access object member
- [Ruby:any](./benchmarks/ruby/any_bench.rb) - single test vs. any
- [Ruby:assign](./benchmarks/ruby/assign_bench.rb) - variable assignment
- [Ruby:block](./benchmarks/ruby/block_bench.rb) - call a block
- [Ruby:const](./benchmarks/ruby/const_val_bench.rb) - const value access
- [Ruby:endless_loop](./benchmarks/ruby/loop2_bench.rb) - different (nearly) endless loops
- [Ruby:forwarding](./benchmarks/ruby/forwarding_bench.rb) - forward a call
- [Ruby:if](./benchmarks/ruby/if_bench.rb) - if vs. ternary if vs. and
- [Ruby:loop](./benchmarks/ruby/loop_bench.rb) - different loops
- [Ruby:method_call](./benchmarks/ruby/method_call_bench.rb) - calling methods
- [Ruby:variable](./benchmarks/ruby/variable_bench.rb) - access a value
- [String: replace_first](./benchmarks/string/replace_first_bench.rb) - replace first sub string
- [String::format](./benchmarks/string/format_bench.rb) - format a Float with two digits
- [String:casecmp](./benchmarks/string/compare_bench.rb) - comparing two Strings case-insensitive
- [String:concat](./benchmarks/string/concat_bench.rb) - concat two Strings
- [String:contains](./benchmarks/string/contains_bench.rb) - test if a String contains another String
- [String:copy](./benchmarks/string/copy_bench.rb) - create a String copy
- [String:remove_char](./benchmarks/string/remove_char_bench.rb) - remove a single char
- [String:remove_chars](./benchmarks/string/remove_chars_bench.rb) - remove some chars
- [String:replace](./benchmarks/string/replace_bench.rb) - replace all sub strings
- [String:start](./benchmarks/string/start_bench.rb) - test if s String starts with a given String
- [String:unpack](./benchmarks/string/unpack_bench.rb) - Integers from binary String
- [Struct:access](./benchmarks/struct/access_bench.rb) - access member Struct/Hash
- [Struct:access_cmp](./benchmarks/struct/read_cmp_bench.rb) - read access member Struct/Data/Hash
- [Struct:create](./benchmarks/struct/create_bench.rb) - create a Struct/Data/Hash
- [Struct:member](./benchmarks/struct/member_bench.rb) - access the member of a Struct
- [Symbol:convert](./benchmarks/symbol/convert_bench.rb) - convert to a Symbol
