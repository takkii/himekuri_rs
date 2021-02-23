# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'ffi'

module Hi
  extend FFI::Library
  ffi_lib File.dirname(__FILE__) + '/himekuri_rust.dll'
  attach_function :himekuri, [], :void
end
