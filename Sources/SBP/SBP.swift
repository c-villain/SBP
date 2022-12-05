import SwiftUI

@available(iOS 13, *)
public class SBP {
    
    /// Show
    ///
    /// > Warning: The returned greeting is not localized. To
    /// > produce a localized string, use ``localizedHello(_:)``
    /// > instead.
    ///
    /// - Parameters:
    ///     - subject: The subject to be welcomed.
    ///
    /// - Returns: A greeting for the given `subject`.
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
