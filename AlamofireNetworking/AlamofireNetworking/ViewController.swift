//
//  ViewController.swift
//  AlamofireNetworking
//
//  Created by Иван Романов on 15.07.2020.
//  Copyright © 2020 Иван Романов. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let url = "https://api.androidhive.info/contacts/"
    let headers: HTTPHeaders = [
    .accept("application/json")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        AF.request(url)
//            .response { (responseData) in
//                debugPrint(responseData)
//        }
        
        AF.request(url)//, headers: headers)
            .responseJSON(completionHandler: { (responseData) in
                print(responseData)
        })
    }

    
}

