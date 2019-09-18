class: title

# The Survival Guide of Building Huge App

10x Faster Dev/Verification Cycle

CJ Lin

---

## Let's do a little survey...
--

### Can't tolerate LONG BUILD TME?
--

### Let's solve it !!!

---

## About me

.left-column-80[
```swift
struct Profile {

    let name = "CJ Lin"

    var identity = "iOS Nerd"

    var company = "LINE"

    var blog = "https://ejameslin.github.io"

    var line = "ejameslin"

    var twitter = "@eJamesLin"

}
```
]

.right-column-20[
<img src="assets/images/cj.png" width="150"/>
]

???

List of App

---

## Build Time
--

### Main Target

.center[
	<img src="assets/images/BuildTimeWholeApp.png" width="400"/>
]

--

### Partitioned Framework Target

.center[
	<img src="assets/images/BuildTimeFramework.png" width="400"/>
]

???

Build time quickly disappear for indexing after build at Xcode title bar...

---

## Framework Partitioning Tips

.center[
	<img src="assets/images/SimpleArchitecture.jpg" width="800"/>
]

---

## Framework Partitioning Tips

.center[
	<img src="assets/images/IdealPartitionedArchitecture.jpg" width="800"/>
]

---

## Framework Partitioning Tips

.center[
	<img src="assets/images/RealArchitecture.jpg" width="800"/>
]

---

class: blank

.vertical-center.center[
## Small Testing-Only Framework
]

---

## Small Testing-Only Framework

### Just start partitioning
--

### Don't worry architecture

---

## Small Testing-Only Framework

* Build Fast
	* Feature related code only
	* Few compile source count

--

.right-column-20[
	<img src="assets/images/TargetMembership.png" width="180"/>
]

* Testing-Only
	* Code in both targets
	* Not embedded in others
	* Not linked by others

---

## Framework Partitioning Tips

### Coordinator / Router

### Dependency Injection

---

## Coordinator / Router

### How `Coordinator` eliminate dependency?

* Example
	1. In `Profile`
	2. Click `Edit` button
	3. Show `EditProfile`
--

* If show `EditProfile` directly in `Profile` class
	* `Profile` is depends on `EditProfile`
	* Difficult to move into framework

---

## Coordinator / Router

```swift
class Coordinator: ProfileViewControllerDelegate {
	viewControllerDidSelectEdit(_ vc: ProfileViewController) {
		// show EditProfileViewController...
	}
}
```

```swift
protocol ProfileViewControllerDelegate: class {
	viewControllerDidSelectEdit(_ vc: ProfileViewController) {}
}

class ProfileViewController: UIViewController {
	weak var delegate: ProfileViewControllerDelegate?
}
```

.center[
<img src="assets/images/Coordinator1.png" width="500"/>
]

---

## Coordinator / Router

```swift
class Coordinator: ProfileViewControllerDelegate {
	viewControllerDidSelectEdit(_ vc: ProfileViewController) {
		// show EditProfileViewController...
	}
}
```

```swift
protocol ProfileViewControllerDelegate: class {
	viewControllerDidSelectEdit(_ vc: ProfileViewController) {}
}

class ProfileViewController: UIViewController {
	weak var delegate: ProfileViewControllerDelegate?
}
```

.center[
<img src="assets/images/Coordinator2.png" width="500"/>
]

---

## Coordinator / Router

```swift
class Coordinator: ProfileViewControllerDelegate {
	viewControllerDidSelectEdit(_ vc: ProfileViewController) {
		// show EditProfileViewController...
	}
}
```

```swift
protocol ProfileViewControllerDelegate: class {
	viewControllerDidSelectEdit(_ vc: ProfileViewController) {}
}

class ProfileViewController: UIViewController {
	weak var delegate: ProfileViewControllerDelegate?
}
```

.center[
<img src="assets/images/Coordinator3.png" width="500"/>
]

---

## Dependency Injection

---

class: blank

.vertical-center.center[
## Framework + Live View
]

---

## Framework + Live View

### SwiftUI Canvas Preview

### Playground

---

## Framework + Playground

.center[
	<img src="assets/images/TodayPlayground.gif" width="800"/>
]

---

## Playground Advantage

.left-column[
.font-large[Live View]
]

.right-column[
* Interactable
]

---

## Playground Advantage

.left-column[
.font-large.grey[Live View]

.font-large[Inline Display]
]

.right-column[
	<img src="assets/images/InlineDisplay.png" width="500"/>
]

---

## Playground Advantage

.left-column[
.font-large.grey[Live View]

.font-large.grey[Inline Display]

.font-large[Run Step by Step]
]

.right-column[
* View change on the fly

<img src="assets/images/RunStep1.png" width="450"/>
]
--

.right-column[
<img src="assets/images/RunStep2.png" width="450"/>
]

???

Similar to Scripting Language

---

## Playground Advantage

.left-column[
.font-large.grey[Live View]

.font-large.grey[Inline Display]

.font-large[Run Step by Step]
]

.right-column[
* View change on the fly
]
.right-column[
* Perfect for network response decoding trial
]

---

## Playground Advantage

.left-column[
.font-large.grey[Live View]

.font-large.grey[Inline Display]

.font-large.grey[Run Step by Step]

.font-large[Vary Screen Size]
]

.right-column[
```swift
viewController.preferredContentSize = Some Size...
```
]

---

## Playground Advantage

.left-column[
.font-large.grey[Live View]

.font-large.grey[Inline Display]

.font-large.grey[Run Step by Step]

.font-large.grey[Vary Screen Size]

.font-large[Vary Language]
]

.right-column[
* Use `NSLocalizedString` with specified language sub-bundle
]

---

## Playground Advantage

.left-column[
.font-large.grey[Live View]

.font-large.grey[Inline Display]

.font-large.grey[Run Step by Step]

.font-large.grey[Vary Screen Size]

.font-large.grey[Vary Language]

.font-large[Fast Access]
]

.right-column[
* Render the page directly
]
--
.right-column[
* No more `Select A`, then `Scroll`, and then `Click B` in order to access some page
]

---

## Custom framework in playground

* Objetive-C framework supported
	* Add bridging header
--

* CocoaPods/Carthage supported

???

Add more detail if still have time

---

## Custom framework in playground

1. Add the playground into the workspace
--

2. `import` or `@testable import` the framework
	with Testability enabled in settings
--

3. Build the framework
--

4. Start playgrounding
--


.footnote[[Apple Document](https://help.apple.com/xcode/mac/9.0/#/devc9b33111c)]

---

## Playground Driven Development

* From Kickstarter [Open Source](https://github.com/kickstarter/ios-oss) and [Speech](https://www.youtube.com/watch?v=DrdxSNG-_DE)
* All code in Framework
* Every page inspectable in playground

.center[
	<img src="assets/images/kickstarter.jpg" width="800"/>
]

---

## Outline

### Framework + Playground

### Playground Advantage

### Playground Tips

### Framework Partitioning Tips

### LLDB

---

## References

* https://help.apple.com/xcode/mac/9.0/#/devc9b33111c

* https://medium.com/flawless-app-stories/playground-driven-development-in-swift-cf167489fe7b

---

## Build and Run no more!

.vertical-center.center[
# Thank you
]
