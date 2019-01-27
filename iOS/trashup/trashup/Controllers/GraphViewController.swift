//
//  GraphViewController.swift
//  trashup
//
//  Created by Mohammadreza on 1/27/19.
//  Copyright © 2019 Mark Mohades. All rights reserved.
//

import UIKit
import Charts
class GraphViewController: UIViewController {

    
    @IBOutlet weak var pieChart: PieChartView!
    var wasteData = PieChartDataEntry(value: 5)
    var recycleData = PieChartDataEntry(value: 10)
    var composeData = PieChartDataEntry(value: 15)
    
    var numberOfDownloadsDataEnteries = [PieChartDataEntry]()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wasteData.label = "Wasted"
        recycleData.label = "Recycled"
        composeData.label = "Composed"
        
        numberOfDownloadsDataEnteries = [wasteData, recycleData, composeData]
        
        updateChartData()
        
        

    }
    


    
    func updateChartData(){
        
        let chartDataSet = PieChartDataSet(values: numberOfDownloadsDataEnteries, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors = [UIColor.flatWatermelon, UIColor.flatGreen, UIColor.flatBlue]
        chartDataSet.colors = colors as! [NSUIColor]
        
        pieChart.data = chartData
        
        
    }

}
