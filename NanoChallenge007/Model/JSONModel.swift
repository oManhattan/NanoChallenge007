//
//  JSONObject.swift
//  NanoChallenge007
//
//  Created by Matheus Cavalcanti de Arruda on 01/02/23.
//

import Foundation

protocol JSONModel: Codable, Hashable {
    
}

extension JSONModel {
    
    func encode() -> Data? {
        do {
            return try JSONEncoder().encode(self)
        } catch {
            return nil
        }
    }
    
    static func encode(_ json: [String:Any]) -> Data? {
        do {
            return try JSONSerialization.data(withJSONObject: json)
        } catch { return nil }
    }
    
    static func decode(_ data: Data) -> Self? {
        do {
            return try JSONDecoder().decode(Self.self, from: data)
        } catch {
            print(error)
            print(error.localizedDescription)
            return nil
        }
    }
    
    static func decode(_ json: [String:Any]) -> Self? {
        if let data = self.encode(json), let item = self.decode(data) {
            return item
        }
        return nil
    }
}
