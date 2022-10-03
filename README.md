# JustoTest

### Swift Package Dependencies 

https://github.com/Alamofire/Alamofire.git

https://github.com/kean/Nuke.git


https://github.com/realm/SwiftLint.git
 
Targets -> Build Phases -> Run Swiftlint Script -> + Add new build Phases

```swift
export PATH="$PATH:/opt/homebrew/bin"
if which swiftlint > /dev/null; then
  swiftlint
else
  echo "warning: SwiftLint not installed, download from https://github.com/realm/SwiftLint"
fi
```

No Storyboard

Info.plist ...-> Delegate Class Name -> $(PRODUCT_MODULE_NAME).SceneDelegate

SceneDelegate instancia RootViewController() como rootViewController
