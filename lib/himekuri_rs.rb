# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "ffi"
require 'rbconfig'
require 'tanraku'

begin
  host_os = RbConfig::CONFIG['host_os']
  case host_os
  when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
    module Hi
      extend FFI::Library
      ffi_lib File.dirname(__FILE__) + '/himekuri_rust.dll'
      attach_function :himekuri, [], :void
    end
  when /darwin|mac os/
    module Hello
      extend FFI::Library
      ffi_lib File.dirname(__FILE__) + "/libhimekuri_rust.dylib"
      attach_function :himekuri, [], :void
    end
  when /linux/
    module World
      extend FFI::Library
      ffi_lib File.dirname(__FILE__) + "/libhimekuri_rust.so"
      attach_function :himekuri, [], :void
    end
  else
    require_relative 'lib/himekuri_rs/version'
    def version_raise
      puts HimekuriRs::VERSION
    end
    version_raise.tanraku
  end
rescue StandardError => e
  puts e.printStackTrace
ensure
  GC.start
end

__END__