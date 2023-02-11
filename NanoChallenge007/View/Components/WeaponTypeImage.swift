//
//  WeaponTypeImage.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 07/02/23.
//

import Foundation
import SwiftUI

enum WeaponTypeImage: String {
    case bow, catalyst, claymore, polearm, sword
    
    func getImage() -> Image {
        return Image("Icon\(self.rawValue.capitalized)")
    }
}
