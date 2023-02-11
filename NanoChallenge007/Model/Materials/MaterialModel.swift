//
//  MaterialModel.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 08/02/23.
//

import Foundation

struct MaterialModel<SpecificMaterial>: JSONModel where SpecificMaterial: JSONModel {
    var name: String
    var specificMaterial: SpecificMaterial
}
