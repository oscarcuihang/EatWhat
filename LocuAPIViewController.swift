//
//  LocuAPIViewController.swift
//  EatWhat
//
//  Created by Hang Cui on 11/7/15.
//  Copyright © 2015 Hang Cui. All rights reserved.
//

import UIKit

class LocuAPIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        let LOCU_API_KEY = "ea3d270f025eac946e9f6606a7381ffe19f69401"
        let centerLatitude = 38.9079417
        let centerLongitude = -92.3197513
        
        let arr = [centerLatitude,centerLongitude,10000]
        let url = NSURL(string: "https://api.locu.com/v2/venue/search")
        var request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "POST"
        var params = ["api_key":LOCU_API_KEY,"fields":["name","location"], "venue_queries":[["location":["geo":["$in_lat_lng_radius":arr]]]]] as [String:AnyObject!]
        
        var err: NSError?
        
        //NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
        
        
        do {
            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(params, options: NSJSONWritingOptions.PrettyPrinted)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
        } catch {
            print("Error:\n \(error)")
        }

        
        
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response:NSURLResponse?, data:NSData?, error:NSError?) -> Void in
            if error == nil {
                var err:NSError?
                let httpResponse = response as! NSHTTPURLResponse!
                //print(response!.description)
                
                if httpResponse.statusCode == 200 {
                    do {
                        let json = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
                        print(json)
                    } catch {
                        print("error")
                    }
                    
                    
                    
                }
            }
            
        })
        
        
    }

}
