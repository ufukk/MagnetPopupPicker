#
# Be sure to run `pod lib lint MagnetPopupPicker.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MagnetPopupPicker"
  s.version          = "0.1.0"
  s.summary          = "Simple and easy to use drop down component for IOS"
  s.description      = <<-DESC
                       Combo-box like UI component with search function and flexible data interface.
                       DESC
  s.homepage         = "https://github.com/ufukk/MagnetPopupPicker"
  s.screenshots     = "https://s3.amazonaws.com/cocoacontrols_production/uploads/control_image/image/4820/popuppicker.png"
  s.license          = 'MIT'
  s.author           = { "ufuk" => "ufuk.kocolu@gmail.com" }
  s.source           = { :git => "https://github.com/ufukk/MagnetPopupPicker.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'MagnetPopupPicker' => ['Pod/Assets/*.png']
  }

end
