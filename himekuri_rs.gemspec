# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require_relative "himekuri_rs/version"

Gem::Specification.new do |spec|
  spec.name          = "himekuri_rs"
  spec.version       = HimekuriRs::VERSION
  spec.authors       = ["Takayuki Kamiyama"]
  spec.email         = ["karuma.reason@gmail.com"]

  spec.summary       = "日めくり、Rust版"
  spec.description   = "日めくりをRustで作りました。"
  spec.homepage      = "https://github.com/takkii/himekuri_rs"
  spec.license       = "MIT"
  spec.executables = %w[himekuri_rs]
  spec.metadata = { "github_repo" => "ssh://github.com/takkii/himekuri_rs" }
  spec.require_paths = ["lib"]
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
end
