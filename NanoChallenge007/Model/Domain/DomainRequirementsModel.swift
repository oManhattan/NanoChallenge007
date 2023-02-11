//
//  DomainRequirementsModel.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 08/02/23.
//

import Foundation

struct DomainRequirementsModel: JSONModel {
    var level: Int
    var adventureRank: Int
    var recommendedLevel: Int
    var leyLineDisorder: [String]
}
