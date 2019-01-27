//
//  ViewController.swift
//  trashup
//
//  Created by Mohammadreza on 1/27/19.
//  Copyright © 2019 Mark Mohades. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController {
    

    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var qouteLabel: UILabel!
    let url = "http://localhost:5000/qoute"
    let url2 = "http://142.44.210.56:8080/open/"
    
    
    @IBOutlet weak var generalWButton: UIButton!
    @IBOutlet weak var recycleWButton: UIButton!
    @IBOutlet weak var wasteWButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        update_qoute()
        profilePic.image = #imageLiteral(resourceName: "Mark")
        makeRounded()

    }

    
    func updateGui(){
        
        self.qouteLabel.sizeToFit()
        
    }
    
    func makeRounded(){
        
        let items = [generalWButton, wasteWButton, recycleWButton, profilePic]
        
        for item in items{

            item!.layer.masksToBounds = true
            item!.layer.cornerRadius = 32/2
        }
        
    }
    
    func update_qoute(){
        
        Alamofire.request(url, method: .get)
            .responseJSON { response in
                if response.result.isSuccess {
                    
                    print("Sucess!")
                    
                    if let qoute : String = JSON(response.result.value!)["qoute"].string{
                        
                        self.qouteLabel.text = qoute
                        self.updateGui()
                        
                    }
                    
                }
                    
                else {
                    print("Error: \(String(describing: response.result.error))")
                    
                    self.qouteLabel.text = "Connection issues."
                }
        }
        
        
    }
    
    
    
    func open(the trash: String){
        
        Alamofire.request(url2 + trash, method: .post)
            .responseJSON { response in
                
                if response.result.isSuccess {
        
                    print("Sucess!")
                }
                    
                else {
                    
                    print("Error: \(String(describing: response.result.error))")
                    
                }
        }
        
    }
    
    
    
    @IBAction func generalButtonPressed(_ sender: Any) {
        
        open(the: "decompose")
        
    }
    
    
    
    @IBAction func recycleButtonPressed(_ sender: Any) {
        
        open(the: "recycle")
    }
    

    @IBAction func wasteButtonPressed(_ sender: Any) {
        
        open(the: "waste")

    }
}

