//
//  Supercar.swift
//  carAPI
//
//  Created by Red Nguyen on 10/2/21.
//

import Foundation

struct superCarModel: Decodable {
    public var supercarmodel:[carModel]
}

struct carModel: Decodable {
    public var name: String
    public var year: String
    public var price: String
}
