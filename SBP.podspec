Pod::Spec.new do |s|
  s.name             = 'SBP'
  s.version          = '0.1.0'
  s.summary          = 'SBP sources'
  s.homepage         = 'https://github.com/c-villain/SBP'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Alex Kraev' => 'lexkraev@gmail.com' }
  s.source           = { :git => 'https://github.com/c-villain/SBP.git', :branch => 'main' }
#   s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'
  s.source_files = 'Sources/SBP/**/*'
end
