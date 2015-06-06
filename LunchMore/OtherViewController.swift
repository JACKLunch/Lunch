//
//  OtherViewController.swift
//  LunchMore
//
//  Created by Alonzo Trove on 4/11/15.
//  Copyright (c) 2015 Alonzo Trove. All rights reserved.
//
import CoreLocation
import Foundation
import UIKit

class OtherViewController: UIViewController {
    
    
    @IBOutlet weak var uberButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        var border = CALayer()
//        var width = CGFloat(2.0)
//        border.borderColor = UIColor.darkGrayColor().CGColor
//        border.frame = CGRect(x: 0, y: 0, width:  uberButton.frame.size.width, height: uberButton.frame.size.height)
//        
//        border.borderWidth = width
//        uberButton.layer.addSublayer(border)
//        uberButton.layer.masksToBounds = true
//        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func yesPressed(sender: AnyObject) {
        uberButton.alpha = 1
    }
    
    @IBAction func buttonAction(sender: AnyObject) {
        var pickupLocation = CLLocationCoordinate2D(latitude: 47.6235481, longitude: -122.336212)
        var uber = Uber(pickupLocation: pickupLocation)
        uber.dropoffLocation = CLLocationCoordinate2D(latitude: 47.591351, longitude: -122.332271)
        uber.dropoffNickname = "Safeco Field"
        uber.deepLink()
    }
}
