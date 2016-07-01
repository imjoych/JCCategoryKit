Pod::Spec.new do |s|
  s.name         = 'JCKit'
  s.version      = '0.0.1'
  s.license      = 'MIT'
  s.summary      = 'Common kit for iOS development.'
  s.homepage     = 'https://github.com/Boych/JCKit'
  s.author       = { 'ChenJianjun' => 'ioschen@foxmail.com' }
  s.source       = { :git => 'https://github.com/Boych/JCKit.git', :tag => s.version.to_s }
  s.source_files = 'JCKit/*.{h,m}'
  s.platform     = :ios, '7.0'
  s.requires_arc = true

end
