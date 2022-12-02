import SwiftUI

//public protocol SbpProtocol {
//    //UIKit
//    func chooseBank()
//    
//}

public class SBP {
    
    public init() { }
    
    public enum UIKit {
        public static func show(on viewController: UIViewController,
                                presentationStyle: UIModalPresentationStyle = .fullScreen) {
            let vc = UIHostingController(rootView: BanksViewConnector() {
                print($0)
//                viewController.presentedViewController?.dismiss(animated: true)
            } onCloseTap: {
                viewController.presentedViewController?.dismiss(animated: true)
            })
            vc.modalPresentationStyle = presentationStyle
            viewController.present(vc, animated: true)
        }
    }

}
