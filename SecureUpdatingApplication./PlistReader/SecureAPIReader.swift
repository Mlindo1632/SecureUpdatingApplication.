//
//  APIReader.swift
//  SecureUpdatingApplication.
//
//  Created by Lindokuhle Khumalo on 2025/03/04.
//

import Foundation

class SecureAPIReader {
    
    static func readValue(key: String) -> String? {
        guard let plistPath = Bundle.main.path(forResource: "ReqResAPIs", ofType: "plist"),
           let plistData = FileManager.default.contents(atPath: plistPath),
              let plist = try? PropertyListSerialization.propertyList(from: plistData, options: [], format: nil) as? [String: Any],
              let value = plist[key] as? String else {
            return nil
        }
        return value
    }
}
