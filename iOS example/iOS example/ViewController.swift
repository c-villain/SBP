//
//  ViewController.swift
//  iOS example
//
//  Created by Alexander Kraev on 25.11.2022.
//

import UIKit
import SBP

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        SBP.UIKit.show(on: self, presentationStyle: .popover) { _ in
//            print("Hello!")
//        }
    }
    
    override func viewDidLayoutSubviews() {
        // fullscreen mode:
        SBP.UIKit.show(on: self)
//        { _ in
//            print("Hello!")
//        }
    }
}

