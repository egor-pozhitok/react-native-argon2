require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = "RNArgon2"
  s.version      = package['version']
  s.summary      = package['description']
  s.description  = package['description']
  s.license      = package['license']

  s.authors      = package['author']
  s.homepage     = package['homepage']

  s.source       = { :git => "https://github.com/poowf/react-native-argon2.git", :tag => "v#{s.version}" }
  s.source_files  = "ios/*.{h,m,swift}"
  s.platform          = :ios, '10.0'

  s.dependency 'React-Core'
  s.dependency 'Argon2Swift', '~> 1.0'

  # Argon2Swift's Swift interface depends on the C module `argon2`, declared in a modulemap under its own sources. 
  # With explicit modules the importing target has to resolve that dependency too, so point this target at the same directory.
  s.pod_target_xcconfig = {
    'SWIFT_INCLUDE_PATHS' => '"$(PODS_ROOT)/Argon2Swift/Sources/Modules"'
  }
end
