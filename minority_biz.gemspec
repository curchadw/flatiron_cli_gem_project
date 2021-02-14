require_relative 'lib/minority_biz/version'

Gem::Specification.new do |spec|
  spec.name          = "minority_biz"
  spec.version       = MinorityBiz::VERSION
  spec.authors       = ["Curtis"]
  spec.email         = ["curtisdevloper@gmail.com"]

  spec.summary       = %q{Write a short summary, because RubyGems requires one.}
  spec.description   = %q{Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/curchadw/flatiron_cli_gem_project"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")
  # spec.log = "https://github.com/curchadw/flatiron_cli_gem_project/blob/master/CHANGELOG.md"

  spec.metadata["allowed_push_host"] = 'http://mygemserver.com'

   spec.metadata["homepage_uri"] = "https://github.com/curchadw/flatiron_cli_gem_project"
  # spec.metadata["source_code_uri"] = ""
  # spec.metadata["changelog_uri"] = ""

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency "pry"
  spec.add_development_dependency "nokogiri"
  

end
