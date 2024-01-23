require_relative "lib/full_system_control/version"

Gem::Specification.new do |spec|
  spec.name        = "et_full_system_control"
  spec.version     = FullSystemControl::VERSION
  spec.authors     = ["Gary Taylor"]
  spec.email       = ["gary.taylor@hismessages.com"]
  spec.homepage    = "https://github.com/hmcts/et-full-system-control"
  spec.summary     = "Controls a service within the full system runtime environment for employment tribunals"
  spec.description = "Gives the developer control of the services running within invoker within the full system runtime environment for employment tribunals"
  spec.license     = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/hmcts/et-full-system-control"
  spec.metadata["changelog_uri"] = "https://github.com/hmcts/et-full-system-control"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.0"
  spec.add_dependency "docker-api", "~> 2.2"
end
