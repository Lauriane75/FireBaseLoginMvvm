//
//  User.swift
//  FireBaseLoginMvvm
//
//  Created by Lauriane Haydari on 29/11/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//


import Foundation

struct User: Codable {
    var uid: Int
    var firstName: String
    var lastName: String
    var password: String
}
