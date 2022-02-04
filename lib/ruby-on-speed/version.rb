# frozen_string_literal: true

module RubyOnSpeed
  VERSION = '0.6.0'
  ID =
    "#{name} v#{VERSION} for Ruby v#{RUBY_VERSION}p#{
      RbConfig::CONFIG['PATCHLEVEL']
    } [#{RbConfig::CONFIG['build']}]"
end
