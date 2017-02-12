Pod::Spec.new do |s|
  s.name         = 'JCCategoryKit'
  s.version      = '0.2.2'
  s.license      = 'MIT'
  s.summary      = 'Category kit for iOS development.'
  s.homepage     = 'https://github.com/Boych/JCCategoryKit'
  s.author       = { 'ChenJianjun' => 'ioschen@foxmail.com' }
  s.source       = { :git => 'https://github.com/Boych/JCCategoryKit.git', :tag => s.version.to_s }
  s.source_files = 'JCCategoryKit/*.{h,m}'
  s.platform     = :ios, '7.0'
  s.requires_arc = true

end
