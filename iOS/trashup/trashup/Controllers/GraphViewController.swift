//
//  GraphViewController.swift
//  trashup
//
//  Created by Mohammadreza on 1/27/19.
//  Copyright © 2019 Mark Mohades. All rights reserved.
//

import UIKit
import Charts
import Alamofire
import SwiftyJSON
class GraphViewController: UIViewController {

    
    @IBOutlet weak var pieChart: PieChartView!
    var wasteData = PieChartDataEntry(value: 8)
    var recycleData = PieChartDataEntry(value: 10)
    var landfillData = PieChartDataEntry(value: 3)
    var status = ["waste":2, "recycle":3, "decompose":1]
    let url2 = "http://142.44.210.56:8080/stats"

    
    var numberOfDownloadsDataEnteries = [PieChartDataEntry]()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wasteData.label = "Wasted"
        recycleData.label = "Recycled"
        landfillData.label = "Decompose"
        
        updateStatus()
        
        
        numberOfDownloadsDataEnteries = [wasteData, recycleData, landfillData]
        
        updateChartData()
        
        

    }
    


    
    func updateChartData(){
        
        
        let chartDataSet = PieChartDataSet(values: numberOfDownloadsDataEnteries, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors = [UIColor.flatWatermelon, UIColor.flatGreen, UIColor.flatBlue]
        chartDataSet.colors = colors as! [NSUIColor]
        
        pieChart.data = chartData
        
        
    }

    
    func updateStatus(){
        
        Alamofire.request(url2, method: .get)
            .responseJSON { response in
                if response.result.isSuccess {
                    
                    print("Sucess22!")

                    if let decompValue = JSON(response.result.value!)["decompose"].int{
                        
                        
                        self.status["decompose"] = decompValue


                    }
                    if let recyValue = JSON(response.result.value!)["recycle"].int{

                        self.status["recycle"] = recyValue

                    
                    if let recyValue = JSON(response.result.value!)["waste"].int{
                        
                        self.status["waste"] = recyValue

                    }
                    self.wasteData.value = Double (self.status["waste"]!)
                    self.landfillData.value = Double (self.status["decompose"]!)
                    self.recycleData.value = Double (self.status["recycle"]!)
                }
                    
                else {
                    print("Error: \(String(describing: response.result.error))")
                

                }
        }
        
        
    }
    
    }
}
