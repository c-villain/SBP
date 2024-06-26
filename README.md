# SDK для работы с СБП НСПК

[![Latest release](https://img.shields.io/github/v/release/c-villain/SBP?color=brightgreen&label=version)](https://github.com/c-villain/SBP/releases/latest)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fc-villain%2FSBP%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/c-villain/SBP)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fc-villain%2FSBP%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/c-villain/SBP)
[![](https://img.shields.io/badge/SPM-supported-DE5C43.svg?color=brightgreen)](https://swift.org/package-manager/)
![](https://img.shields.io/github/license/c-villain/SBP)

[![contact: @lexkraev](https://img.shields.io/badge/contact-%40lexkraev-blue.svg?style=flat)](https://t.me/lexkraev)
[![Telegram Group](https://img.shields.io/endpoint?color=brightgreen&url=https%3A%2F%2Ftg.sumanjay.workers.dev%2Fswiftui_dev)](https://telegram.dog/swiftui_dev)


Swift package for service SBP (СБП), more details about SBP you can find [here](https://sbp.nspk.ru).

## Quick Start

### with UIKit

you may define smth like this:

```swift
import SwiftUI
import SBP

@available(iOS 13.0, *)
final class SBPay {
    
  func chooseBank(on viewController: UIViewController,
                    presentationStyle: UIModalPresentationStyle = .fullScreen,
                    completion: @escaping (String) -> (),
                    onClose: @escaping () -> ()) {
        registerFonts()
        let vc = UIHostingController(rootView: BanksView() {
            print($0)
            completion($0)
            viewController.presentedViewController?.dismiss(animated: true)
        } onCloseTap: {
            onClose()
            viewController.presentedViewController?.dismiss(animated: true)
        })
        vc.modalPresentationStyle = presentationStyle
        viewController.present(vc, animated: true)
    }
}


class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    SBPay().chooseBank(on: self) {
      print($0)
    }
  }
}
```
### with SwiftUI

Just use `BanksView()`

### project settings

also you need add <b>LSApplicationQueriesSchemes</b> key into you project <b>info.plst</b> 

```plst
 <key>LSApplicationQueriesSchemes</key>
  <array>
    <string>bank100000000000</string>
    <string>bank100000000001</string>
    ...
    <string>bank100000000999</string>
    <string>bank100000001000</string>
  </array>
```

<b>Warning!</b> Starting with iOS 15 there's limit in maximum 50 entries in list, so you probably need to take first 50 entries from [c2bmembers.json](https://qr.nspk.ru/proxyapp/c2bmembers.json). Look for details [here](https://developer.apple.com/documentation/uikit/uiapplication/1622952-canopenurl#discussion).

That's need for ```UIApplication.shared.canOpenURL``` method worked correctly.
You can copy and paste all lines from example

### Different cases

Based on the infomartion above service is trying to find installed apps and then module opens screen with the list of bank apps:

  <p align="left">
  <img src="demo/with_apps.gif" alt="" width="200">
  </p>
  
  Otherwise the service offers to choose the bank connected to SBP from the list:
  
  <p align="left">
  <img src="demo/no_apps.gif" alt="" width="200">
  </p>
  

