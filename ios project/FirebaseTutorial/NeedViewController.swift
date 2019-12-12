//
//  NeedViewController.swift
//  FirebaseTutorial
//
//  Created by kuet on 28/11/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class NeedViewController: UIViewController {
    var dest : Spots?
    
    @IBOutlet var webv: UIWebView!
    
    @IBAction func btn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Details") as! DetailsViewController
        vc.id = self.dest
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func hotel(_ sender: Any) {
        let str = "https://www.google.com/maps/search/hotels+near+"
        let urL = URL(string : str + dest!.name)
        let req = URLRequest(url : urL!)
        webv.loadRequest(req)
        
    }
    
    @IBAction func police(_ sender: Any) {
        let str = "https://www.google.com/maps/search/police+near+"
        var st = dest!.name
        if st == "Cox's Bazar"{
            st = "Cox's+Bazar"
        }
        let urL = URL(string : str + st)
        let req = URLRequest(url : urL!)
        webv.loadRequest(req)
        
    }
    
    @IBAction func medic(_ sender: Any) {
        let str = "https://www.google.com/maps/search/hospitals+near+"
        var st = dest!.name
        if st == "Cox's Bazar"{
            st = "Cox's+Bazar"
        }
        let urL = URL(string : str + st)
        let req = URLRequest(url : urL!)
        webv.loadRequest(req)
        
    }
    
    @IBAction func rest(_ sender: Any) {
        let str = "https://www.google.com/maps/search/restaurents+near+"
        var st = dest!.name
        if st == "Cox's Bazar"{
            st = "Cox's+Bazar"
        }
        let urL = URL(string : str + st)
        let req = URLRequest(url : urL!)
        webv.loadRequest(req)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var str = "https://www.google.com/maps/place/"
       var st = dest!.name
        if st == "Cox's Bazar"{
            st = "Cox's+Bazar"
        }
        let urL = URL(string : str + st)
        print(urL)
        let req = URLRequest(url : urL!)
        print(req)
        webv.loadRequest(req)
        // Do any additional setup after loading the view.
    }

    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
