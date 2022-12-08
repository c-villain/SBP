Pod::Spec.new do |s|
  s.name             = 'SBP'
  s.version          = '0.2.8'
  s.summary          = 'SBP sources'
  s.homepage         = 'https://github.com/c-villain/SBP'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Alex Kraev' => 'lexkraev@gmail.com' }
  s.source           = { :git => 'https://github.com/c-villain/SBP.git', :branch => 'main' }
  s.swift_version = '5.0'
  s.source_files = 'Sources/SBP/**/*.swift'
  s.ios.resource_bundle = {'SBP' => 'Sources/SBP/**/*.{json,png,jpeg,jpg,xcassets,strings,json,lproj}'}
  s.resources = ['Sources/SBP/**/*.{json,png,jpeg,jpg,xcassets,strings,json,lproj}']
end
