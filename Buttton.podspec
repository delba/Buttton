Pod::Spec.new do |s|
  s.name         = "Buttton"
  s.version      = "0.1"
  s.license      = { :type => "MIT" }
  s.homepage     = "https://github.com/delba/Buttton"
  s.author       = { "Damien" => "damien@delba.io" }
  s.summary      = "A supercharged UIButton"
  s.source       = { :git => "https://github.com/delba/Buttton.git", :tag => "v0.1" }

  s.ios.deployment_target = "8.0"

  s.source_files = "Source/*.swift"

  s.requires_arc = true
end
