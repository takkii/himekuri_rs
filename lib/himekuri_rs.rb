# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "ffi"

module Hello
  extend FFI::Library
  ffi_lib "./lib/libhimekuri_rust.dylib"
  attach_function :himekuri, [], :void
end
