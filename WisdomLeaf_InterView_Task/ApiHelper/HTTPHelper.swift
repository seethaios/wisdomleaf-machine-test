//
//  HTTPHelper.swift
//  WisdomLeaf_InterView_Task
//
//  Created by Ragulkumar K V on 25/04/23.
//

import Foundation

class HttpRequestHelper {
    func GET(url: String, complete: @escaping (Bool, Data?) -> ()) {
        
        guard let url = URL(string: url) else {
            print("Error: cannot create URLCompontents")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("XMLHttpRequest", forHTTPHeaderField: "X-Requested-With")
        let config = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: config)
        session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print("Error: problem calling GET")
                print(error!)
                complete(false, nil)
                return
            }
            guard let data = data else {
                print("Error: did not receive data")
                complete(false, nil)
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
                print("Error: HTTP request failed")
                complete(false, nil)
                return
            }
            complete(true, data)
        }.resume()
    }
}
