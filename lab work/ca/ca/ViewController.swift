//
//  ViewController.swift
//  ca
//
//  Created by kuet on 14/10/19.
//  Copyright © 2019 kuet. All rights reserved.
//

import UIKit
struct course:Decodable {
    let id : Int
    let name : String
    let link : String
    let imageUrl : String
    let number_of_lessons : Int
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let json="http://api.letsbuildthatapp.com/jsondecodable/courses"
        
        guard let url = URL(string:json)else {return}
        URLSession.shared.dataTask(with: url){(data,response,error) in
            
            do{
            
            var countries = try JSONDecoder().decode([course].self,from:data!)
            countries.sort { (lhs: course, rhs: course) -> Bool in
                    return lhs.id < rhs.id
            }
            for temp in countries{
            print("{")
            print("id:" , temp.id)
            print("name:" , temp.name)
            print("image_url:" , temp.imageUrl)
            print("link:" , temp.link)
            print("number_of_lessons:" , temp.number_of_lessons)
            print("}")
            print("")
            }
        }
            catch
            {
                
            }
        }.resume()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

