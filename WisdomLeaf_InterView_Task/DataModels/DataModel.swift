//
//  DataModel.swift
//  WisdomLeaf_InterView_Task
//
//  Created by Ragulkumar K V on 25/04/23.
//

import Foundation

typealias productDataModel = [ProductDataModel]

struct ProductDataModel: Codable {

    var id: Int?
    var title: String?
    var description: String?
    var price:Double?
    var image: String?
    var rating:Ratings?
}
struct Ratings: Codable {
    
    var rate: Double?
    var count: Int?
}
