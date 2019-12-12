//
//  PlaceViewController.swift
//  FirebaseTutorial
//
//  Created by kuet on 24/10/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class PlaceViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet var tableView: UITableView!
    
    final let url = URL(string: "https://api.myjson.com/bins/zhr6e")
    
    var spotsar = [Spots]()
    public var sp : Spots?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self as? UITableViewDelegate
        self.tableView.dataSource = self
        self.tableView.rowHeight = 180.0
        self.tableView.allowsSelection = true
        downloadjson()
        // Do any additional setup after loading the view.
    }

    /*override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }*/

    func downloadjson(){
        guard let downloadurl = url else {return}
        URLSession.shared.dataTask(with: downloadurl){
            data,urlResponse,error in
            guard let data = data, error == nil, urlResponse != nil else{ print("wrong**********\n")
            return
            }
            print("down***********\n")
            do {
              //  let spots = try JSONDecoder().decode(SpotAra.self,from:data)
               /* for temp in spots{
                    print("{")
                    print("id:" , temp.id)
                    print("name:" , temp.name)
                    print("image_url:" , temp.imgurl)
                    print("}")
                    print("")
                }*/
               // var spots : SpotAra
               let decoder = JSONDecoder()
               let  spots = try decoder.decode([Spots].self , from: data)
                self.spotsar = spots
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                print(spots.count)
               
            } catch{
                print("Error******\n")
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spotsar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Places") as? Places else {return UITableViewCell() }
       // print(cell.button.tag)
        cell.namelb.text = spotsar[indexPath.row].name
        //cell.button.tag = indexPath.row;
       // print(cell.button.tag)
      //  cell.accessoryType = .detailDisclosureButton
        
        //print(spotsar[indexPath.row].name)
        if let image = URL(string : spotsar[indexPath.row].imgurl){
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: image)
                if let data = data {
                    let img = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imagelb.image = img
                    }
                }
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Details") as! DetailsViewController
        vc.id = self.spotsar[indexPath.row]
        sp = self.spotsar[indexPath.row]
        print(vc.id?.name ?? spotsar[indexPath.row].name+"*")
        self.present(vc, animated: true, completion: nil)
       // self.performSegue(withIdentifier: "DetailsViewController", sender: self)
    //    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Details")
    //    self.present(vc!, animated: true, completion: nil)
        
      // let vc = DetailsViewController()
   //     vc.id = indexPath.row
        
    }
   
    
 /*   func tableView(_ tableView: UITableView, didSelectRowAt indexPath : IndexPath) {
        print("okkkk")
        //  let storyboard = UIStoryboard(name: String(describing: DetailsViewController.self), bundle: nil)
        //  let vc = storyboard.instantiateViewController(withIdentifier: "Details")
        //  self.present(vc, animated: true, completion: nil)
        let selectedTrail = indexPath.row
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController {
            viewController.id = selectedTrail
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        if(indexPath.section == 1){
            print("ok")
            return true
        }
        return false
    }

  //  var selectedImage:String?
  //  var selectedLabel:String?
  var idx :Int?
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("****************")
        idx = indexPath.row
        print("Row \(indexPath.row)selected")
      //  selectedImage = self.spotsar[indexPath.row].imgurl
      //  selectedLabel = self.spotsar[indexPath.row].name
        performSegue(withIdentifier: "Details", sender: self)
    }
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "Details") {
            let vc = segue.destination as! DetailsViewController
           // vc.imglb = selectedImage
            vc.id = idx
        }
    }
*/
}
