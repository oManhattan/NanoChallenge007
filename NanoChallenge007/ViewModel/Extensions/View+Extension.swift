//
//  View+Extension.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 01/02/23.
//

import Foundation
import SwiftUI

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

extension Array: JSONModel where Element: Hashable, Element: Codable {
    
}

extension Array {
    func getElementAt(_ index: Int) -> Element? {
        if index < self.endIndex {
            return self[index]
        }
        return nil
    }
}

extension Data {
    func jsonObject() -> [String:Any]? {
        if let json = try? JSONSerialization.jsonObject(with: self) as? [String:Any] {
            return json
        }
        return nil
    }
}

extension CGFloat {
    
    static func getBounds() -> (higher: Self, lower: Self) {
        let hight = UIScreen.main.bounds.height
        let width = UIScreen.main.bounds.width
        
        return (self.maximum(hight, width), self.minimum(hight, width))
    }
}
