#
# Be sure to run `pod lib lint CoolaPod.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "CoolaPod"
  s.version          = "2.0.8"
  s.summary          = "CoolaData sdk."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = "CoolaData SDK for iOS clients."

  s.homepage         = "https://github.com/cooladata/pod"
  s.license          = 'MIT'
  s.author           = { "Tomer Ben-Moshe" => "tomer@cooladata.com" }
  s.source           = { :git => "https://github.com/cooladata/pod.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

#s.source_files = 'Pod/Classes/**/*'
  s.vendored_frameworks = 'Pod/Frameworks/cooladata-ios-sdk.framework'
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
