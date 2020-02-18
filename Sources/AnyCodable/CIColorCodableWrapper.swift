//
//  File.swift
//  
//
//  Created by Eliot Andres on 2/18/20.
//

import Foundation
import CoreImage

struct CIColorCodableWrapper {
    let ciColor: CIColor
}

extension CIColorCodableWrapper: Codable {
    enum CodingKeys: String, CodingKey {
        case ciColor
    }
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let colorString = try values.decode(String.self, forKey: .ciColor)
        ciColor = CIColor(string: colorString)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(ciColor.stringRepresentation, forKey: .ciColor)
    }
}

