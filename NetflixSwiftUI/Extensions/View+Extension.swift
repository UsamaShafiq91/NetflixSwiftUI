//
//  View+Extension.swift
//  NetflixSwiftUI
//
//  Created by UsamaShafiq on 24/12/2024.
//

import Foundation
import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), 
                                        to: nil,
                                        from: nil,
                                        for: nil)
    }
}
