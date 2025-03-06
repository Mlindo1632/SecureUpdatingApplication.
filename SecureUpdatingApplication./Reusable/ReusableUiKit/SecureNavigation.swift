//
//  SecureNavigation.swift
//  SecureUpdatingApplication.
//
//  Created by Lindokuhle Khumalo on 2025/03/04.
//

import Foundation
import UIKit

struct SecureNavigation {
    
    static func navigate(from currentVC: UIViewController,to viewcontrollerType: UIViewController.Type) {
        DispatchQueue.main.async {
            let viewcontroller = String(describing: viewcontrollerType)
            let nextViewcontroller = viewcontrollerType.init(nibName: viewcontroller, bundle: nil)
            currentVC.navigationController?.pushViewController(nextViewcontroller, animated: true)
        }
    }
}
