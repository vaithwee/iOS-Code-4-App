//
//  HttpController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/30.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit

protocol HttpPortocol {
    func didRecieveResults(resultes:NSDictionary);
}

class HttpController: NSObject {
    var delegate:HttpPortocol?
    
    func onSearch(urlStr:String) {
        let url:NSURL = NSURL(string: urlStr)!;
        let request:NSURLRequest = NSURLRequest(URL: url);
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (respons, data, error) in
            let jsonResult:NSDictionary = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as! NSDictionary;
            self.delegate?.didRecieveResults(jsonResult);
        }
    }
}
