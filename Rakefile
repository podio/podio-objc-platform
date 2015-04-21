WORKSPACE = 'PodioPlatformKit.xcworkspace'
SCHEME = 'PodioPlatformKit'

desc 'Run unit tests'
task :test do
  sh "xcodebuild -workspace #{WORKSPACE} -scheme #{SCHEME} clean build test"
end