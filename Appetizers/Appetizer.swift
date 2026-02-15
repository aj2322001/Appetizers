//
//  Appetizer.swift
//  Appetizers
//
//  Created by Archit  Joshi on 14/02/26.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: String
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let protein: Int
    let calories: Int
    let carbs: Int
}

struct MockData {
    static let sampleAppetizer: Appetizer = Appetizer(id: "01",
                                                      name: "some random Name",
                                                      description: "some random description... some random description... some random description... some random description... some random description... some random description... some random description... some random description... some random description... some random description... some random description... some random description... some random description... ",
                                                      price: 8.99,
                                                      imageURL: "foodImage",
                                                      protein: 500,
                                                      calories: 5000,
                                                      carbs: 50)
   
    static let sampleAppetizerArr: [Appetizer] = [sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer]
}
