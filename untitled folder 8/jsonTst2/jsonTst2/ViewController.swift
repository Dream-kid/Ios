//
//  ViewController.swift
//  jsonTst2
//
//  Created by kuet on 15/10/19.
//  Copyright © 2019 kuet. All rights reserved.
//

import UIKit

struct Course {
    let id: Int
    let name: String
    let link: String
    let imageUrl: String
    let number_of_lessons: Int
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let json = "http://api.letsbuildthatapp.com/jsondecodable/courses"
        guard let url = URL(string: json) else { return }
        
        URLSession.shared.dataTask(with: url) { (data,response,error) in
            guard let data = data else { return }
         //   let dataAsString = String(data: data, encoding: .utf8)
         //   print(dataAsString)
            
            do {
               let json  = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                print(json)
            } catch let jsonErr {
                
            }
        }.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

