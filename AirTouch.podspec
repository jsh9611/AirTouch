#
# Be sure to run `pod lib lint AirTouch.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AirTouch'
  s.version          = '0.1.0'
  s.summary          = 'A camera view with hand pose recognition.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This library will be used for contactless UI.
                       DESC

  s.homepage         = 'https://github.com/jsh9611/AirTouch'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jsh9611' => 'jangsh9611@naver.com' }
  s.source           = { :git => 'https://github.com/jsh9611/AirTouch.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '14.0'
  s.source_files = 'AirTouch/Classes/**/*'
#  s.resources = 'AirTouch/Assets/**/*'

  # s.resource_bundles = {
  #   'AirTouch' => ['AirTouch/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'AVFoundation', 'SwiftUI', 'AVFoundation', 'Vision', 'CoreGraphics', 'Foundation', 'Combine'
  s.swift_versions = '5.0'
  # s.dependency 'AFNetworking', '~> 2.3'
end
