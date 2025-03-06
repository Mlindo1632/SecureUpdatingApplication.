//
//  SecureActivityIndicator.swift
//  SecureUpdatingApplication.
//
//  Created by Lindokuhle Khumalo on 2025/03/04.
//

import Foundation
import UIKit

struct SecureAcivityIndicator {
    
    static func stopAndHideActivityIndicator(_ activityIndicator: UIActivityIndicatorView) {
        DispatchQueue.main.async {
            activityIndicator.stopAnimating()
            activityIndicator.hidesWhenStopped = true
        }
    }
}
