# frozen_string_literal: true

require_relative "lib/rack/naked-to-www"

Gem::Specification.new "rack-naked-to-www" do |spec|
  spec.name = "rack-naked-to-www"
  spec.version = Rack::NakedToWww::VERSION
  spec.authors = ["motdotla"]
  spec.email = ["mot@mot.la"]

  spec.summary = "rack-naked-to-www"
  spec.description = "Redirect naked domain to www"
  spec.homepage = "https://github.com/dotenv-org/rack-naked-to-www"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.3.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/dotenv-org/rack-naked-to-www"
  spec.metadata["changelog_uri"] = "https://github.com/dotenv-org/rack-naked-to-www"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rack"
end
