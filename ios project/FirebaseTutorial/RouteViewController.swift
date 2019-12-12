//
//  RouteViewController.swift
//  FirebaseTutorial
//
//  Created by kuet on 28/11/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import Firebase
import FirebaseAuth

class RouteViewController: UIViewController {
    var dest : Spots?
    var source : String?
    
    @IBOutlet var webvi: UIWebView!
    @IBOutlet var src: UITextField!
    @IBAction func lctn(_ sender: Any) {
        if src.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your location", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            
        }else {
            source = src.text
            print(source ?? "#")
            var str = "https://www.google.com/maps/dir/"
            str = str + source!  + "/"
            var st = dest?.name
            if st == "Sundarbans" {
                st = "Koromjol+Watch+Tower"
            }
            if st == "Cox's Bazar"{
                st = "Cox's+Bazar"
            }
            str = str + st!
            let urL = URL(string : str )
            let req = URLRequest(url : urL!)
            webvi.loadRequest(req)
        }
        
    }
    @IBAction func tpbtn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Details") as! DetailsViewController
        vc.id = self.dest
        self.present(vc, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       // mapv.delegate = self
        var str = "https://www.google.com/maps/place/"
        var st = dest!.name
        if st == "Cox's Bazar"{
            st = "Cox's+Bazar"
        }
        let urL = URL(string : str + st)
        print(urL)
        let req = URLRequest(url : urL!)
        print(req)
        webvi.loadRequest(req)
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
