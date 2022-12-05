import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        SBPay()
            .chooseBank(on: self,
                        onBankChoose: { print($0) },
                        onClose: { } )
    }
}

