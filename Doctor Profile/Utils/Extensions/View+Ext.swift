//
//  View+Ext.swift
//  Doctor Profile
//
//  Created by Aasem Hany on 30/07/2024.
//

import SwiftUI

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
