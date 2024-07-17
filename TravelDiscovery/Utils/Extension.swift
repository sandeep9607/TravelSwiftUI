//
//  Extension.swift
//  TravelDiscovery
//
//  Created by iMac on 01/01/24.
//

import Foundation
import SwiftUI

extension Color {
    static let contentBackground = Color(.init(white:0.95,alpha: 1))
    static let defaultBackground = Color(Constant.defaults)
}

extension View {
    func asTile() -> some View {
        modifier(TileModifer())
    }
}
