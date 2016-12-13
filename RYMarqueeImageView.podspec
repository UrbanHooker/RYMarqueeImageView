Pod::Spec.new do |s|
  s.name         = "RYMarqueeImageView"
  s.version      = "1.0.0"
  s.summary      = "A UIImageView with marquee effect"
  s.homepage     = "http://dreamwithroy.com"
  s.license      = "MIT"
  s.authors      = { 'urbanhooker' => 'urbanhooker@163.com'}
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/UrbanHooker/RYMarqueeImageView.git", :tag => s.version }
  s.source_files = 'RYMarqueeImageView/*'
  s.requires_arc = true
end