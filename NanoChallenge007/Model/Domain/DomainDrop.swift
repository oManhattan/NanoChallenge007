//
//  DomainDrop.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 08/02/23.
//

import Foundation

struct DomainDrop: JSONModel {
    var name: String
    var dropMin: Int
    var dropMax: Int
    
    enum CodingKeys: String, CodingKey {
        case name
        case dropMin = "drop_min"
        case dropMax = "drop_max"
    }
}
