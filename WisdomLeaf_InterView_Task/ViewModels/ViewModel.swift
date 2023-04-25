//
//  ViewModel.swift
//  WisdomLeaf_InterView_Task
//
//  Created by Ragulkumar K V on 25/04/23.
//

import Foundation

class ProductViewModel: NSObject {
    
    private var dataService: DataServiceProtocol
    
    var reloadTableView: (() -> Void)?
    
    var showAlert: (() -> Void)?
    
    var limit: String = "5"
    
    init(dataService: DataServiceProtocol = DataService()) {
        self.dataService = dataService
    }
    

    var productData : productDataModel? {
        didSet {
            reloadTableView?()
        }
    }
    
    var errorString: String? {
        didSet {
            showAlert?()
        }
    }
    func getProducts(limit: String) {
        dataService.getProductData(limit:limit) { success, model, error in
            if success, let product = model {
                self.productData = product
                
            } else {
                self.errorString = error
            }
        }
    }
}
