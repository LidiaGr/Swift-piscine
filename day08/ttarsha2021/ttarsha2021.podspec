#
# Be sure to run `pod lib lint ttarsha2021.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ttarsha2021'
  s.version          = '0.1.0'
  s.summary          = 'A pod for swift_piscine 42 Day08'
  s.swift_versions   = '4.0.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  'Day08 objective is to create a package that will use the CoreData framework to learn how to use data persistance and models. The aim being to create an article manager that will serve as interface for the D09.'
                       DESC

  s.homepage         = 'https://github.com/LidiaGr/Swift_piscine.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'LidiaGr' => 'lidia.ls16@gmail.com' }
  s.source           = { :git => 'https://github.com/LidiaGr/Swift_piscine.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'ttarsha2021/Classes/**/*'
  s.resource    = 'ttarsha2021/Assets/*'
  
  # s.resource_bundles = {
  #   'ttarsha2021' => ['ttarsha2021/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'CoreData'
  # s.dependency 'AFNetworking', '~> 2.3'
end
