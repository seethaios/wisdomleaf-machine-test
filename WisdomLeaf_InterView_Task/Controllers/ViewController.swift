//
//  ViewController.swift
//  WisdomLeaf_InterView_Task
//
//  Created by Ragulkumar K V on 25/04/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        
        moveToDashBoardPage()
    }
    
    func moveToDashBoardPage() {
       let delayTime = DispatchTime.now() + 5
       DispatchQueue.main.asyncAfter(deadline: delayTime, execute: {
           let vc = self.storyboard?.instantiateViewController(withIdentifier: "DataViewController") as! DataViewController
           self.navigationController?.pushViewController(vc, animated: true)
       })
    }
}

