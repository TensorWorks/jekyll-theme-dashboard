# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "jekyll-theme-dashboard"
  spec.version       = "0.0.1"
  spec.authors       = ["TensorWorks Pty Ltd"]
  spec.email         = ["contact@tensorworks.com.au"]

  spec.summary       = "Dashboard theme for Jekyll"
  spec.homepage      = "https://github.com/TensorWorks/jekyll-theme-dashboard"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r!^(assets|_layouts|_includes|_sass|LICENSE|README|_config\.yml)!i) }

  spec.add_runtime_dependency "jekyll", "~> 4.2"
end
