//
//  ViewController.swift
//  jp
//
//  Created by kuet on 14/10/19.
//  Copyright © 2019 kuet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var abc: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageURL = URL(string:"https://images.pexels.com/photos/67636/rose-blue-flower-rose-blooms-67636.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500")!
        let task=URLSession.shared.dataTask(with: imageURL){(data,response,error)
            in
            if error==nil{
                let loadtime=UIImage(data:data!)
                self.abc.image=loadtime
            }
        }
        task.resume();
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

