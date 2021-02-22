Pod::Spec.new do |s|
          #1.
          s.name               = "JTDCategoryView"
          #2.
          s.version            = "1.2.0"
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
	     s.swift_version    = '4.2'
          #11.
          #s.resources          = "JTDCategoryView/JTDCategoryView.bundle"
          #12.
          s.resource_bundles = {'JTDCategoryViewBundle' => ['JTDCategoryView/Assets/*.xcassets']} 
          # *.png
          # *.xcassets

          # since Apple release Apple Silicon and use arm64 for the simulator, but iOS x86_64 for iOS
          # https://github.com/CocoaPods/CocoaPods/issues/10065
          spec.pod_target_xcconfig = {
               'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
          }
          spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    end