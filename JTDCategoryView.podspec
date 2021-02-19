Pod::Spec.new do |s|
          #1.
          s.name               = "JTDCategoryView"
          #2.
          s.version            = "1.1.6"
          #3.  
          s.summary         = "Sort description of 'JTDCategoryView' framework"
          #4.
          s.homepage        = "https://cocoapods.org"
          #5.
          s.license              = "MIT"
          #6.
          s.author               = "JustinTsouDeveloper"
          #7.
          s.platform            = :ios, "11.0"
          #8.
          s.source              = { :git => "https://github.com/JustinTsouDeveloper/JTDCategoryView.git", :tag => s.version.to_s }
          #9.
          s.source_files     = "JTDCategoryView", "JTDCategoryView/**/*.{h,m,swift,xib}"
	  #10.
	  s.swift_version = '4.2'
    end