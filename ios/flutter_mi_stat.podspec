#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_mi_stat'
  s.version          = '0.0.1'
  s.summary          = 'Flutter plugin for mi stat.'
  s.description      = <<-DESC
Flutter plugin for mi stat.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.frameworks = 'MobileCoreServices', 'SystemConfiguration'
  s.libraries = 'z'
  s.vendored_libraries = 'Classes/libMiStatSDK.a'
  s.static_framework = true
  s.ios.deployment_target = '8.0'
end

