class: title

# 10x Faster App Dev/Verification Cycle

The Survival Guide of Building Huge App

CJ Lin

???

This talk is not about lower overall build time

It's about tips of faster dev/verification cycle

Let's start it!

---

## About

.left-column-80[
```swift
struct Profile {

    let name = "CJ Lin"

    var identity = "iOS Nerd"

    var company = "LINE"

    var blog = "https://ejameslin.github.io"

    var github = "https://github.com/eJamesLin"

    var line = "ejameslin"

    var twitter = "@eJamesLin"
}
```
]

.right-column-20[
<img src="assets/profile/cj.png" width="150"/>
<img src="assets/profile/LINE.png" width="50"/>
<img src="assets/profile/LINE-SDK.png" width="50"/>
<img src="assets/profile/LINE-TODAY.png" width="50"/>
<img src="assets/profile/BobMarley.png" width="50"/>
<img src="assets/profile/MamiLove.png" width="50"/>
<img src="assets/profile/MENU.png" width="50"/>
]

---

class: blank

.vertical-center.center[
## Don't Build-and-Run Whole App
]

---

## Outline

### LLDB Code Injection

???

Minimize the number of rebuild

--

### Develop only at Framework
--

### Verify the Framework

---

## Outline

### LLDB Code Injection

.grey[
### Develop only at Framework

### Verify the Framework
]

---

## LLDB Code Injection

* LLDB and Breakpoints

* Modify control flow without rebuild

---

## Code Injection Example - Login

.vertical-center.center[
    <img src="assets/images/lldb-breakpoint1.png" width="650"/>
]

---

## Code Injection Example - Login

.vertical-center.center[
    <img src="assets/images/lldb-breakpoint2.png" width="800"/>
]

---

## Code Injection - REPL

* LLDB + REPL

* Read-Eval-Print-Loop (REPL)

* Access public functions and global variables

* Inject new functions

---

## Code Injection Example - Fibonacci

.vertical-center.center[
    <img src="assets/images/repl-example1.png" width="800"/>
]

---

## Code Injection Example - Fibonacci

* Type `repl` to enter

.center[
    <img src="assets/images/repl-enter.png" width="800"/>
]

---

## Code Injection Example - Fibonacci

* Inject new function

.center[
    <img src="assets/images/repl-injection.png" width="700"/>
]

---

## Code Injection Example - Fibonacci

* Call the function and verify

.center[
    <img src="assets/images/repl-call-function.png" width="700"/>
]

---

## Code Injection Example - Fibonacci

* Prefix `:` to run LLDB command

.center[
    <img src="assets/images/repl-p.png" width="600"/>
]

---

## Code Injection Example - Fibonacci

* Type single colon to return back to LLDB 

.center[
    <img src="assets/images/repl-return.png" width="250"/>
]

---

## Code Injection Example - Fibonacci

* Modify variable by calling the injected function

.center[
    <img src="assets/images/repl-breakpoint-call-injected-function.png" width="810"/>
]

---

## Code Injection Example - API

* In the code todo
* Implement a view model to download API json

.center[
    <img src="assets/images/lldb-ex3-breakpoint.png" width="800"/>
]

---

## Code Injection Example - API

* Type `e` in LLDB to enter multi-line expressions

.center[
    <img src="assets/images/lldb-ex3-e.png" width="800"/>
]

---

## Code Injection Example - API

* Inject ViewModel and API code

.center[
    <img src="assets/images/lldb-ex3-inject-vm.png" width="800"/>
]

---

## Code Injection Example - API

* Json URL

.center[
    <img src="assets/images/lldb-ex3-inject-vm1.png" width="800"/>
]

---

## Code Injection Example - API

* Download 

.center[
    <img src="assets/images/lldb-ex3-inject-vm2.png" width="800"/>
]

---

## Code Injection Example - API

* Runloop handling at LLDB

.center[
    <img src="assets/images/lldb-ex3-inject-vm3.png" width="800"/>
]

---

## Code Injection Example - API

* Call the injected function

.center[
    <img src="assets/images/lldb-ex3-call-vm.png" width="800"/>
]

---

## Code Injection Example - API

* Inspect the result

.center[
    <img src="assets/images/lldb-ex3-v.png" width="800"/>
]

---

## Outline

.grey[
### LLDB Code Injection
]

### Develop only at Framework

.grey[
### Verify the Framework
]

---

## Let's do a little survey...

???

App build time > 10 mins
--

### Can't tolerate LONG BUILD TIME?

### Let's solve it !!!

.center[
	<img src="assets/images/survey.jpg" width="600"/>
]

---

## Build Time

### Main Target

.center[
	<img src="assets/images/BuildTimeWholeApp.png" width="450"/>
]

???

MacBook Pro (15-inch, 2017)

3.1 GHz Intel Core i7

16 GB 2133 MHz LPDDR3

--

### Partitioned Framework Target

.center[
	<img src="assets/images/BuildTimeFramework.png" width="600"/>
]

???

Build time quickly disappear for indexing after build at Xcode title bar...

---

class: blank

.vertical-center.center[
## Don't Build-and-Run Whole App
]

---

## Framework Partitioning Tips

.center[
	<img src="assets/images/SimpleArchitecture.jpg" width="800"/>
]

???

Feature could be MVC or MVVM or MVP

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

## Let's start from small step

.vertical-center.center[
### Ideal partition is too ideal
]

---

## Let's start from small step

.vertical-center.center[
### Small Testing-Only Framework
]

---

## Small Testing-Only Framework

* Build Fast
	* Feature related code only
	* Few compile source count

--

.right-column-20[
	<img src="assets/images/TargetMembership.png" width="200"/>
]

* Testing-Only
	* Code in both targets
	* Not embedded in others
	* Not linked by others
--

* Easy to apply on existing project

---

## Framework Partitioning Tips

* Coordinator / Router

---

## Coordinator / Router

### How `Coordinator` eliminate dependency?

* Example
	* In `Profile`, Click `Edit` button, Show `EditProfile`

.center[
<img src="assets/images/Coordinator0.png" width="500"/>
]

--

* `Profile` is depends on `EditProfile`
--

* Difficult to move into framework

---

## Coordinator / Router

.vertical-center.center[
<img src="assets/images/Coordinator1.png" width="700"/>
]

---

## Coordinator / Router

.vertical-center.center[
<img src="assets/images/Coordinator2.png" width="700"/>
]

---

## Coordinator / Router

.vertical-center.center[
<img src="assets/images/Coordinator3.png" width="700"/>
]

---

## Coordinator / Router

```swift
protocol ProfileViewControllerDelegate: class {
	viewControllerDidSelectEdit(_ vc: ProfileViewController) {}
}

class ProfileViewController: UIViewController {
	weak var delegate: ProfileViewControllerDelegate?
}
```

--

```swift
class Coordinator: ProfileViewControllerDelegate {
	viewControllerDidSelectEdit(_ vc: ProfileViewController) {
		// show EditProfileViewController...
	}
}
```

---

## Framework Partitioning Tips

* .grey[Coordinator / Router]

* Dependency Injection

---

## Dependency Injection Example

.center[
<img src="assets/images/DI-none.png" width="600"/>
]
--

.center[
<img src="assets/images/DI-1.png" width="600"/>
]
--

.center[
<img src="assets/images/DI-2.png" width="600"/>
]

---

## Dependency Injection Example
--

```
protocol AnalyticsProtocol {
    func track(screen: AnalyticsScreen)
}
```

???

Start from `AnalyticsProtocol` definition
--

```
class Analytics: AnalyticsProtocol {
    func track(screen: AnalyticsScreen) {
        GA.track(screen: screen)
    }
}
```

???

`Analytics` conforms to the protocol
--

```
class FeedController: UIViewController {
    let analytics: AnalyticsProtocol
    init(analytics: AnalyticsProtocol) {
        self.analytics = analytics
        super.init(nibName: nil, bundle: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        analytics.track(screen: .feed)
    }
```

???

Controller is now depends on only the protocol,
not the `Analytics`, nor the implementation detail GA.

---

## Framework Partitioning Tips

* Ready for framework partitioning

.center[
    <img src="assets/images/PartitionedArchitecture.jpg" width="800"/>
]

---

## Outline

.grey[
### Code Injection to minimize rebuild

### Develop only at Framework
]

### Verify the Framework

---

## Framework + Live View

### SwiftUI Canvas Preview

### Playground

---

## Framework + Live View

### SwiftUI Canvas Preview

.grey[
### Playground
]

---

## SwiftUI Canvas Preview Advantage
--

.left-column[
.font-large[Live Preview]
]

.right-column[
* Interactable
]
--

.right-column[
* Can also preview UIViewController / UIView

* Even if the minimum target is iOS 12 and below
]

---

## SwiftUI Preview at iOS 12 and below

Though SwiftUI cannot be used at iOS 12 and below 

Still could preview existing screens

```
The `@available(iOS 13.0, *)` is not enough...

dyld: Library not loaded: /System/Library/Frameworks/SwiftUI.framework/SwiftUI
```

--

```
Known Issues and Workaround: -weak_framework
Apps containing SwiftUI inside a Swift package might not run on versions of iOS earlier than iOS 13. (53706729)
```

.center[
<img src="https://ejameslin.github.io/assets/2019/SwiftUI-weak-framework.png" width="600"/>

.footnote[[iOS 13 Release Notes](https://developer.apple.com/documentation/ios_ipados_release_notes/ios_13_release_notes)]
]

---

## SwiftUI Canvas Preview Advantage

.left-column[
.font-large.grey[Live Preview]

.font-large[Fast Access]
]

.right-column[
* Render the page directly

* No need following steps
1. Select A
2. Scroll
3. Click B
4. ...
]

---

## SwiftUI Canvas Preview Advantage

.left-column[
.font-large.grey[Live Preview]

.font-large.grey[Fast Access]

.font-large[Preview device size]
]

.right-column[
```swift
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        	.previewDevice("iPhone 11")
    }
}
```
]

---

## SwiftUI Canvas Preview Advantage

.left-column[
.font-large.grey[Live Preview]

.font-large.grey[Fast Access]

.font-large.grey[Preview device size]

.font-large[Group Preview]
]

.right-column[
```
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            	.previewDevice("iPhone SE")

            ContentView()
            	.previewDevice("iPhone 11")
        }
    }
}
```
]

---

## SwiftUI Canvas Preview Advantage

.left-column[
.font-large.grey[Live Preview]

.font-large.grey[Fast Access]

.font-large.grey[Preview device size]

.font-large.grey[Group Preview]

.font-large[Vary Language]
]

.right-column[
```
struct SwiftUIText: View {
    var body: some View {
        Text("HelloKey")
    }
}
struct PreviewSwiftUIText: PreviewProvider {
    static var previews: some View {
        Group {
            SwiftUIText()
            .environment(\.locale, 
                		 Locale(identifier: "en"))
            .previewDisplayName("en")

            SwiftUIText()
	        .environment(\.locale, 
	            	     Locale(identifier: "ja"))
	        .previewDisplayName("ja")
        }
        .previewLayout(.sizeThatFits)
    }
}
```
]

.left-column[
<img src="assets/images/SwiftUI-preview-Text.png" width="160"/>
]

---

## SwiftUI Canvas Preview Advantage

.left-column[
.font-large.grey[Live Preview]

.font-large.grey[Fast Access]

.font-large.grey[Preview device size]

.font-large.grey[Group Preview]

.font-large[Vary Language]
]

.right-column[
### Not work at `NSLocalizedString`
]

---

## SwiftUI Preview + NSLocalizedString

.center[
<img src="assets/images/SwiftUI-preview-NSLocalizedString.png" width="850"/>
]

---

## SwiftUI Canvas Preview + Framework

### Known Issue

```
Previews in packages always perform a full build of the active scheme. (51030302)
```
.footnote[[Xcode 11 Release Notes](https://developer.apple.com/documentation/xcode_release_notes/xcode_11_release_notes)]

.center[
<img src="assets/images/SwiftUI-preview-issue.png" width="800"/>
]

---

## SwiftUI Canvas Preview + Framework

```
Previews in packages always perform a full build of the active scheme. (51030302)
```

Main Scheme

.center[
<img src="assets/images/SwiftUI-preview-issue-main-scheme.png" width="630"/>
]

--

Framework Scheme - Solution

.center[
<img src="assets/images/SwiftUI-preview-issue-framework.png" width="630"/>
]

---

## Framework + Live View

.grey[
### SwiftUI Canvas Preview
]

### Playground

---

## Playground + Framework

Currently Playground is more stable than SwiftUI canvas preview...

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

.font-large[Fast Access]
]

.right-column[
* Render the page directly

* No need following steps
1. Select A
2. Scroll
3. Click B
4. ...
]

---

## Playground Advantage

.left-column[
.font-large.grey[Live View]

.font-large.grey[Fast Access]

.font-large[Inline Display]
]

.right-column[
	<img src="assets/images/InlineDisplay.png" width="500"/>
]

---

## Playground Advantage

.left-column[
.font-large.grey[Live View]

.font-large.grey[Fast Access]

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

.font-large.grey[Fast Access]

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

.font-large.grey[Fast Access]

.font-large.grey[Inline Display]

.font-large.grey[Run Step by Step]

.font-large[Vary Screen Size]
]

.right-column[
```swift
viewController.preferredContentSize = Some Size
```
]

???

No safe area...

---

## Playground Advantage

.left-column[
.font-large.grey[Live View]

.font-large.grey[Fast Access]

.font-large.grey[Inline Display]

.font-large.grey[Run Step by Step]

.font-large.grey[Vary Screen Size]

.font-large[Vary Language]
]

.right-column[
* Use `NSLocalizedString` with specified language sub-bundle

<img src="assets/images/vary-lang.png" width="500"/>
]

---

## Test Driven Development in Playground

* To build faster at every iteration
	* SUT (System Under Test) in Framework
	* Start unit test in playground, move to test target for CI after completed

```
MyUnitTests.defaultTestSuite().run() // in playground
```

.center[
<img src="assets/images/TDD.png" width="400"/>
.font-small[[Image Source](https://www.allaboutcircuits.com/technical-articles/how-test-driven-development-can-help-you-write-better-unit-tests/)]
]

---

## Playground Driven Development

* From Kickstarter [Open Source](https://github.com/kickstarter/ios-oss) and [Speech](https://www.youtube.com/watch?v=DrdxSNG-_DE)
* All code in Framework
* Every page inspectable in playground

.center[
	<img src="assets/images/kickstarter.jpg" width="800"/>
]

---

class: blank

.vertical-center.center[
## Don't Build-and-Run Whole App
]

---

## Thank You

* The slides is made by Markdown powered by [remark](https://github.com/gnab/remark)

* The markdown and sample code of the slides could be found [here](https://github.com/eJamesLin/FastAppDevCycle)

.center[<img src="assets/profile/SlidesQRCode.svg" width="200"/>]

* Happy Coding and Thank You

