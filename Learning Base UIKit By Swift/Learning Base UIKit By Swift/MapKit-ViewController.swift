//
//  MapKit-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/6/2.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapKit_ViewController: UIViewController {

    let mapView = MKMapView();
    let locationManager = CLLocationManager();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.frame = self.view.bounds;
        self.view.addSubview(self.mapView);
        
        self.mapView.mapType = .Standard;
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
