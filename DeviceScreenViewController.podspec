#
#  Be sure to run `pod spec lint DeviceScreenViewController.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "DeviceScreenViewController"
  s.version      = "0.1.3"
  s.summary      = "DeviceScreenViewController helps to simulate device screen traits."
  s.description  = "DeviceScreenViewController helps to simulate device screen traits: status bar, safe area etc. It's pretty useful in playgrounds and screenshot generation."
  s.homepage     = "https://github.com/pgmarchenko/DeviceScreenViewController"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "Pavel Marchenko" => "pgmarchenko@gmail.com" }

  s.platform     = :ios
  s.ios.deployment_target = '9.0'

  s.source       = { :git => "https://github.com/pgmarchenko/DeviceScreenViewController.git", :tag => s.version.to_s }

  s.source_files  = "DeviceScreenViewController/sources/**/*.swift"

  s.framework = "UIKit"
  s.framework = "CoreGraphics"

  s.requires_arc = true
  s.swift_version = "4.2"

end
