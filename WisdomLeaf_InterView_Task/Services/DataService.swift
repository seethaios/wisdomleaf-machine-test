//
//  DataService.swift
//  WisdomLeaf_InterView_Task
//
//  Created by Ragulkumar K V on 25/04/23.
//

import Foundation

protocol DataServiceProtocol {
    func getProductData(limit:String, completion: @escaping (_ success: Bool, _ results: productDataModel?, _ error: String?) -> ())
}

class DataService: DataServiceProtocol {
    
    func getProductData(limit:String, completion: @escaping (Bool, productDataModel?, String?) -> ()) {
        
        HttpRequestHelper().GET(url: "https://fakestoreapi.com/products?limit=" + limit) { success, data in
            if success {
                do {
                    let model = try JSONDecoder().decode(productDataModel.self, from: data!)
                    completion(true, model, nil)
                } catch {
                    completion(false, nil, "Trying to parse Product to model")
                }
            } else {
                completion(false, nil, "Product GET Request failed")
            }
        }
    }
}
