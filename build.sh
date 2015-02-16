#!/bin/sh

set -e

CONFIG=Release
WORKSPACE=PodioPlatformKit.xcworkspace
SCHEME="Framework"

# Install dependencies
pod install

# Build framework
xcodebuild -workspace $WORKSPACE -scheme $SCHEME -configuration $CONFIG clean build

echo "Done. PodioPlatformKit.framework has been copied to your desktop."