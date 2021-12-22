#
# Be sure to run `pod lib lint CoolaPod.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "CoolaPod"
  s.version          = "2.5"
  s.summary          = "CoolaData sdk"
  s.description      = "CoolaData SDK for iOS clients."

  s.homepage         = "https://github.com/cooladata/pod"
  s.license          = 'MIT'
  s.author           = { "Tomer Ben-Moshe" => "tomer@cooladata.com" }
  s.source           = { :git => "https://github.com/cooladata/pod.git", :tag => s.version.to_s }

  s.ios.deployment_target = "9.0"
  s.requires_arc = true

  s.preserve_paths = 'Cooladata.xcframework/*'
  s.source_files = 'Cooladata.xcframework/ios-arm64_armv7/Cooladata.framework/Headers/*.{h,m}'
  s.vendored_frameworks = 'Cooladata.xcframework'
  s.public_header_files = 'Cooladata.xcframework/ios-arm64_armv7/Cooladata.framework/Headers/*.{h,m}'
end
