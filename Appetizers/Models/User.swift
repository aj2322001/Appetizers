//
//  User.swift
//  Appetizers
//
//  Created by Archit Joshi on 29/06/26.
//

import Foundation

struct User: Codable {
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var birthday: Date = Date()
    var extraNakins: Bool = false
    var freqRefills: Bool = false
}
