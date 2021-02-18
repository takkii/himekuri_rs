# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require_relative "himekuri_rs/version"
require "ffi"

module Hello
  ruby_version = (RUBY_VERSION).to_s
  ruby_folder_version = ("3.0.0").to_s
  version = (HimekuriRs::VERSION).to_s
  himekuri_rs = "himekuri_rs-".to_s + version.to_s
  
  extend FFI::Library
  ffi_lib "$HOME/.rbenv/versions/" + ruby_version + "/lib/ruby/gems/" + ruby_folder_version + "/gems/" + himekuri_rs +  "/lib/" + "libhimekuri_rust.dylib"
  attach_function :himekuri, [], :void
end
