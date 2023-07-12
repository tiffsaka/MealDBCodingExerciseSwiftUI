//
//  Extensions.swift
//  MealDBSwiftUI
//
//  Created by Tiffany Sakaguchi on 7/5/23.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        return self.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    func updateLineSpacing() -> String {
        return self.contains("\r\n\r\n") ? self : self.replacingOccurrences(of: "\n", with: "\n\n")
    }
}
