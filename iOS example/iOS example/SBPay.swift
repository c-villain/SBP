import SwiftUI
import SBP

final class SBPay {
    
  func chooseBank(on viewController: UIViewController,
                    presentationStyle: UIModalPresentationStyle = .fullScreen,
                    onBankChoose: @escaping (String) -> (),
                    onClose: @escaping () -> ()) {
        
        let vc = UIHostingController(rootView: BanksView() {
            onBankChoose($0)
            viewController.presentedViewController?.dismiss(animated: true)
        } onCloseTap: {
            onClose()
            viewController.presentedViewController?.dismiss(animated: true)
        })
        vc.modalPresentationStyle = presentationStyle
        viewController.present(vc, animated: true)
    }
}
