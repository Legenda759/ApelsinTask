//
//  MainViewController.swift
//  ApelsinTask
//
//  Created by Legenda_759 on 20/05/22.
//

import UIKit
#if canImport(CreditCardScanner)
import CreditCardScanner
#endif



class MainViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "creditcard"), style: .plain, target: self, action: #selector(runCreditCardScanner))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "menucard"), style: .plain, target: self, action: #selector(runMRZScanner))
    }
    
    @objc func runCreditCardScanner() {
        if #available(iOS 13, *) {
            let creditCardScannerViewController = CreditCardScannerViewController(delegate: self)
            present(creditCardScannerViewController, animated: true)
        } else {
            print("Oh well...")
        }
    }
    
    @objc func runMRZScanner() {
        let mrzScanner = MRZScannerViewController()
        present(mrzScanner, animated: true)
    }

}
@available(iOS 13, *)
extension MainViewController: CreditCardScannerViewControllerDelegate {
    func creditCardScannerViewController(_ viewController: CreditCardScannerViewController, didErrorWith error: CreditCardScannerError) {
        self.dismiss(animated: true)
        print(error.errorDescription ?? "Unknown error")
    }
    
    func creditCardScannerViewController(_ viewController: CreditCardScannerViewController, didFinishWith card: CreditCard) {
        print("\(card)")
    }
    
    
}
