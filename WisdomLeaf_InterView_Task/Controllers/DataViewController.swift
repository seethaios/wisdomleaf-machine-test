//
//  DataViewController.swift
//  WisdomLeaf_InterView_Task
//
//  Created by Ragulkumar K V on 25/04/23.
//

import UIKit


class DataViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var viewModel = ProductViewModel()
    
    var selectedItem:[Int] = []
    
    var limit = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SwiftLoader.show(animated: true)
        navigationController?.isNavigationBarHidden = true
        viewModel.getProducts(limit: String(limit))
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                SwiftLoader.hide()
                
                self?.tableView.reloadData()
            }
        }
        showError()
        // Do any additional setup after loading the view.
    }
    func showError() {
        
        viewModel.showAlert = { [weak self] in
            DispatchQueue.main.async {
                SwiftLoader.hide()
                self!.showAlertError(titleStr: "Alert", messageStr: (self?.viewModel.errorString)!)
            }
        }
    }
    @objc func checkBoxBtnAct(sender:UIButton) {
        
        if selectedItem.contains(sender.tag) {
            
            selectedItem = selectedItem.filter { $0 != sender.tag}
        }
        else {
            
            selectedItem.append(sender.tag)
        }
        let indexPath = IndexPath(row: sender.tag, section: 0)
        tableView.reloadRows(at: [indexPath], with: .none)
        
    }
    
    @IBAction func refreshButtonClickAct(_ sender: Any) {
        
        limit = 5
        selectedItem = []
        SwiftLoader.show(animated: true)
        viewModel.getProducts(limit: String(limit))
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
}
extension DataViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.productData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductListTableViewCell", for: indexPath) as! ProductListTableViewCell
        cell.singleData = viewModel.productData?[indexPath.row]
        cell.orderButton.addTarget(self,action: #selector(checkBoxBtnAct),for: .touchUpInside)
        cell.orderButton.tag = indexPath.row
        if selectedItem.contains(indexPath.row) {
            cell.checkBoxImage.image = UIImage(named: "check")
        }
        else {
            cell.checkBoxImage.image = UIImage(named: "uncheck")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if (indexPath.row == viewModel.productData!.count - 1) {
            
            if !(limit > viewModel.productData!.count) {
                limit = limit + 5
                viewModel.getProducts(limit: String(limit))
            }
        }
    }
}

