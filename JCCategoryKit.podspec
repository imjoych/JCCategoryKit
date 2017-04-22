Pod::Spec.new do |s|
  s.name         = 'JCCategoryKit'
  s.version      = '1.0.1'
  s.license      = 'MIT'
  s.summary      = 'Category kit for iOS development.'
  s.homepage     = 'https://github.com/imjoych/JCCategoryKit'
  s.author       = { 'ChenJianjun' => 'imjoych@gmail.com' }
  s.source       = { :git => 'https://github.com/imjoych/JCCategoryKit.git', :tag => s.version.to_s }
  s.source_files = 'JCCategoryKit/*.{h,m}'
  s.platform     = :ios, '7.0'
  s.requires_arc = true

end
