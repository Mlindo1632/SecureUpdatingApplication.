//
//  EmployeViewController.swift
//  SecureUpdatingApplication.
//
//  Created by Lindokuhle Khumalo on 2025/03/05.
//

import UIKit

class HomeEmployeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        SecureToast.showToast(message: "Successfully Logged in", backgroundColour: .green, viewController: self)
    }
}
