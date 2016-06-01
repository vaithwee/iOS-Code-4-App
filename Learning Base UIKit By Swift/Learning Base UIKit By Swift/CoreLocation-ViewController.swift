//
//  CoreLocation-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by Vaith on 16/6/1.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit
import CoreLocation

class CoreLocation_ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager:CLLocationManager = CLLocationManager();
    
    @IBOutlet weak var directionLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var levelAccuracyLabel: UILabel!
    @IBOutlet weak var verticalLongitudeLabel: UILabel!
    @IBOutlet weak var altitudeLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = 0.1;
        self.locationManager.requestAlwaysAuthorization();
        if CLLocationManager.locationServicesEnabled() {
            self.locationManager.startUpdatingLocation();
            print("定位开始");
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let curr = locations.last!;
        longitudeLabel.text = "经度：\(curr.coordinate.longitude)";
        latitudeLabel.text = "纬度：\(curr.coordinate.latitude)";
        altitudeLabel.text = "海拔：\(curr.altitude)";
        verticalLongitudeLabel.text = "垂直精度：\(curr.verticalAccuracy)";
        levelAccuracyLabel.text = "水平精度：\(curr.horizontalAccuracy)";
        directionLabel.text = "方向:\(curr.course)";
        speedLabel.text = "速度：\(curr.speed)";
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
