# JustoTest

### Swift Package Dependencies 

https://github.com/Alamofire/Alamofire.git

https://github.com/kean/Nuke.git


https://github.com/realm/SwiftLint.git

Install 
Targets -> Build Phases -> Run Swiftlint Script -> + Add new build Phases

export PATH="$PATH:/opt/homebrew/bin"
if which swiftlint > /dev/null; then
  swiftlint
else
  echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi
