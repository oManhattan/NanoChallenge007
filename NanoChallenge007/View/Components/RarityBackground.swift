//
//  RarityBackground.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 06/02/23.
//

import Foundation
import SwiftUI

enum RarityBackground: Int {
    case star1 = 1
    case star2 = 2
    case star3 = 3
    case star4 = 4
    case star5 = 5
    
    func getBackground() -> Image {
        return Image("Background\(self.rawValue)")
    }
}
