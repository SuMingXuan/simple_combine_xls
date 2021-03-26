require_relative 'lib/simple_combine_xls/version'

Gem::Specification.new do |spec|
  spec.name          = "simple_combine_xls"
  spec.version       = SimpleCombineXls::VERSION
  spec.authors       = ["sumingxuan"]
  spec.email         = ["1154621382@qq.com"]

  spec.summary       = %q{combine excel cell like drawing}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/SuMingXuan/simple_combine_xls"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")


  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "spreadsheet", '~> 1.2', '>= 1.2.8'
end
