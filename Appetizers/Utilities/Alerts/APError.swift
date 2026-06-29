//
//  APError.swift
//  Appetizers
//
//  Created by Archit  Joshi on 14/02/26.
//

import Foundation

enum APError: Error {
    // Network Error
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
    
    // Account Error
    case invalidForm
    case invalidEmail
    case userSaveSuccess
    case invalidUserData
}
