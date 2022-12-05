import SwiftUI

//public protocol SbpProtocol {
//    //UIKit
//    func chooseBank()
//    
//}

public class SBP {
    
    public init() { }
    
    public enum UIKit {
        public func chooseBank(on viewController: UIViewController,
                        presentationStyle: UIModalPresentationStyle = .fullScreen,
                        completion: @escaping (String) -> (),
                        onClose: @escaping () -> ()) {
            let vc = UIHostingController(rootView: BanksViewConnector() {
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

}
