require_relative '../lib/ruby_on_speed'

A_SAMPLE_STRING = 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'.freeze
SAMPLE_REGEXP = /cillum/.freeze
SAMPLE_NON_REGEXP = /ruby/.freeze

RubyOnSpeed.check do
  uses_boolean_results!
  code 'Regexp#=~', ->{ SAMPLE_REGEXP =~ A_SAMPLE_STRING }
  code 'String#=~', ->{ A_SAMPLE_STRING =~ SAMPLE_REGEXP }
  code 'Regexp#===', ->{ SAMPLE_REGEXP === A_SAMPLE_STRING }
  code 'Regexp#match', ->{ SAMPLE_REGEXP.match(A_SAMPLE_STRING) }
  code 'String#match', ->{ A_SAMPLE_STRING.match(SAMPLE_REGEXP) }
end

RubyOnSpeed.check do
  uses_boolean_results!
  code '!Regexp#=~', ->{ SAMPLE_NON_REGEXP =~ A_SAMPLE_STRING }
  code '!String#=~', ->{ A_SAMPLE_STRING =~ SAMPLE_NON_REGEXP }
  code '!Regexp#===', ->{ SAMPLE_NON_REGEXP === A_SAMPLE_STRING }
  code '!Regexp#match', ->{ SAMPLE_NON_REGEXP.match(A_SAMPLE_STRING) }
  code '!String#match', ->{ A_SAMPLE_STRING.match(SAMPLE_NON_REGEXP) }
end
