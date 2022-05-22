//
//  MRZScannerViewController.swift
//  ApelsinTask
//
//  Created by Legenda_759 on 20/05/22.
//

import UIKit
import QKMRZScanner

class MRZScannerViewController: UIViewController {
    
    let mrzScannerView = QKMRZScannerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        mrzScannerView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mrzScannerView.startScanning()
        view.addSubview(mrzScannerView)
        mrzScannerView.frame = view.bounds
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        mrzScannerView.stopScanning()
    }

}

extension MRZScannerViewController: QKMRZScannerViewDelegate {
    func mrzScannerView(_ mrzScannerView: QKMRZScannerView, didFind scanResult: QKMRZScanResult) {
        print(scanResult.birthdate as Any, scanResult.countryCode, scanResult.documentNumber, scanResult.documentType, scanResult.expiryDate, scanResult.givenNames, scanResult.nationalityCountryCode, scanResult.personalNumber, scanResult.personalNumber2, scanResult.sex, scanResult.surnames)
    }
}
