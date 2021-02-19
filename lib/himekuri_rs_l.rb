# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "ffi"

module World
  extend FFI::Library
  ffi_lib File.dirname(__FILE__) + "/libhimekuri_rust.so"
  attach_function :himekuri, [], :void
end