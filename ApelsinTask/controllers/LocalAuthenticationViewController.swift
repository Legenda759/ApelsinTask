//
//  LocalAuthenticationViewController.swift
//  ApelsinTask
//
//  Created by Legenda_759 on 20/05/22.
//

import UIKit
import SnapKit
import LocalAuthentication

class LocalAuthenticationViewController: BaseViewController {
    
    let localAuthenticationButton: UIButton = {
        let localAuthenticationButton = UIButton()
        localAuthenticationButton.backgroundColor = .systemBlue
        localAuthenticationButton.tintColor = .white
        localAuthenticationButton.setImage(UIImage(systemName: "hand.raised"), for: .normal)
        localAuthenticationButton.addTarget(self, action: #selector(localAuthenticationButtonTapped), for: .touchUpInside)
        return localAuthenticationButton
    }()
    
    
    
    var context = LAContext()
    var err: NSError?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(localAuthenticationButton)
        localAuthenticationButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(localAuthenticationButton.snp.height)
        }
    }
    
    @objc func localAuthenticationButtonTapped() {
//        sceneDelegate().callMainViewController()
        let localString = "Biometric Authentication!"
        if context.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &err) {
            if context.biometryType == .faceID {
                print("Face id biometrics")
            }else if context.biometryType == .touchID {
                print("Touch id biometrics")
            }else {
                print("Biometrics")
            }
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: localString, reply: { (succes, error) in
                if succes {
                    DispatchQueue.main.async {
                        self.sceneDelegate().callMainViewController()
                    }
                }
            })
        }
    }
    
}
