Pod::Spec.new do |s|
  
  s.name                = 'PodioPlatformKit'
  s.version             = '0.1.5'
  s.source              = { :git => 'https://github.com/podio/podio-objc-platform.git', :tag => s.version.to_s, :submodules => true }

  s.summary             = "PodioPlatformKit is an Objective-C client library for the Podio Platform API."
  s.homepage            = "https://github.com/podio/podio-objc-platform"
  s.license             = 'MIT'
  s.authors             = {
    "Sebastian Rehnby" => "sebastian@podio.com",
    "Romain Briche" => "briche@podio.com",
    "Lauge Jepsen" => "lauge@podio.com"
  }

  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'
  s.requires_arc          = true

  s.default_subspec = 'Common'

  core_path = 'Vendor/podio-objc-core/PodioKitCore'

  s.subspec 'Common' do |sp|
    
    sp.source_files = [
      "PodioPlatformKit/Common/**/*.{h,m}", 
      "#{core_path}/Common/**/*.{h,m}"
    ]
    
    sp.public_header_files = [
      "PodioPlatformKit/Common/**/*.h",
      "#{core_path}/Common/**/*.h"
    ]
    
    # iOS only
    sp.ios.source_files = [
      'PodioPlatformKit/UIKit/**/*.{h,m}',
      "#{core_path}/UIKit/**/*.{h,m}"
    ]
    
    sp.ios.public_header_files = [
      'PodioPlatformKit/UIKit/*.h',
      "#{core_path}/UIKit/*.h"
    ]
    
    sp.ios.frameworks = 'UIKit'
  end

  # Push (real-time) functionality needs to be explicitly included
  # due to additional dependencies
  s.subspec 'Push' do |sp|
    sp.source_files = "#{core_path}/Push/**/*.{h,m}"
    sp.public_header_files = "#{core_path}/Push/**/*.h"

    sp.dependency 'PodioPlatformKit/Common'
    sp.dependency 'DDCometClient',  '~> 1.1'
    sp.dependency 'FXReachability', '~> 1.3'
  end
end
