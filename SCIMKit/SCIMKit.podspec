#
# Be sure to run `pod lib lint SCIMKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SCIMKit'
  s.version          = '0.1.0'
  s.summary          = 'A short description of SCIMKit.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/<GITHUB_USERNAME>/SCIMKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Vaith' => 'vaithwee@yeah.net' }
  s.source           = { :git => 'https://github.com/<GITHUB_USERNAME>/SCIMKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SCIMKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SCIMKit' => ['SCIMKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'CoreTelephony', 'SystemConfiguration'
  s.libraries = 'z', 'sqlite3', 'c++'
  s.vendored_frameworks = 'SCIMKit/Frameworks/IMCore.framework', 'SCIMKit/Frameworks/ImSDK.framework', 'SCIMKit/Frameworks/QALSDK.framework', 'SCIMKit/Frameworks/TLSSDK.framework'
  # s.dependency 'AFNetworking', '~> 2.3'
end
