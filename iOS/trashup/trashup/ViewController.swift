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
import ChameleonFramework


class ViewController: UIViewController {
    

    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var qouteLabel: UILabel!
    let qUrl = "http://142.44.210.56:8080/quote"
    let url2 = "http://142.44.210.56:8080/"
    var status = ["waste":0, "recycle":0, "landfill":0]
    var moneyRate = ["waste":3.0, "recycle": 5.0, "landfill": 2.0]
    var moneySaved = 0.0
    
    
    @IBOutlet weak var generalWButton: UIButton!
    @IBOutlet weak var recycleWButton: UIButton!
    @IBOutlet weak var wasteWButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        update_qoute()
        profilePic.image = #imageLiteral(resourceName: "Mark")
        makeRounded()
        updateStatus()
//        updateGui()


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
        
        Alamofire.request(qUrl, method: .get)
            .responseJSON { response in
                if response.result.isSuccess {
                    
                    print("Sucess!")
                    
                    if let qoute : String = JSON(response.result.value!)["quote"].string{
                        
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
        
        Alamofire.request(url2 + "/open/\(trash)", method: .post)
            .responseJSON { response in
                
                if response.result.isSuccess {
        
                    print("Sucess!")
                }
                    
                else {
                    
                    print("Error: \(String(describing: response.result.error))")
                    
                }
        }
        
    }
    
    
    func animate (this button: UIButton){
        
        UIView.animate(withDuration: 0.6,
                       animations: {
                        button.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.6) {
                            button.transform = CGAffineTransform.identity
                        }
        })
        
    }
    
    
    func updateStatus(){
        
        Alamofire.request(url2+"stats", method: .get)
            .responseJSON { response in
                if response.result.isSuccess {
                    
                    print("Sucess!")
                    
                    if let decompValue = JSON(response.result.value!)["decompose"].int{
                        
                        self.status["decompose"] = decompValue
                        
                    }
                    if let recyValue = JSON(response.result.value!)["recycle"].int{
                        
                        self.status["recycle"] = recyValue
                        //                        self.updateGui()
                    }
                }
                    
                else {
                    print("Error: \(String(describing: response.result.error))")
                                    }
        }
        
        
    }
    

    
    func calculateMoneySaved(){
        
        
        for item in status{
            
            moneySaved += moneyRate[item.key]! * Double (item.value)
            
        }
        
    }
    
    
    
    
    
    @IBAction func generalButtonPressed(_ sender: Any) {
        
        animate(this: generalWButton)
        open(the: "decompose")
        
    }
    
    
    
    @IBAction func recycleButtonPressed(_ sender: Any) {
        
        animate(this: recycleWButton)

        open(the: "recycle")
    }
    

    @IBAction func wasteButtonPressed(_ sender: Any) {
        
        animate(this: wasteWButton)
        open(the: "waste")

    }
    
    
    
    
}

