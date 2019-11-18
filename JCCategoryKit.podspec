Pod::Spec.new do |s|
  s.name         = 'JCCategoryKit'
  s.version      = '1.1.0'
  s.summary      = 'Category kit for iOS development.'
  s.homepage     = 'https://github.com/imjoych/JCCategoryKit'
  s.author       = { 'ChenJianjun' => 'imjoych@gmail.com' }
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.source       = { :git => 'https://github.com/imjoych/JCCategoryKit.git', :tag => s.version.to_s }
  s.source_files = 'JCCategoryKit/*.{h,m}'
  s.requires_arc = true

  s.ios.deployment_target = '8.0'
  s.watchos.deployment_target = '2.0'

end
