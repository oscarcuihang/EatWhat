//
//  LocuNViewController.swift
//  EatWhat
//
//  Created by Hang Cui on 11/9/15.
//  Copyright © 2015 Hang Cui. All rights reserved.
//

import UIKit
import WebKit


class LocuNViewController: UIViewController, WKNavigationDelegate {

    //let urlString = "https://api.locu.com/v1_0/venue/search/?postal_code=65201&menus&api_key=ea3d270f025eac946e9f6606a7381ffe19f69401"
    
    var webView : WKWebView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //load(urlString)
        
        webView.frame = self.view.bounds
        webView.navigationDelegate = self
        webView.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        self.view.addSubview(webView)
        
        let urlPath : NSString = "http://babbage.cs.missouri.edu/~hcfxd/ios/test2.html"
        var url: NSURL = NSURL(string: urlPath as String)!
        var request: NSURLRequest = NSURLRequest(URL: url)
        webView.loadRequest(request)
    }
    
    
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("webView began navigation")
    }
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        print("did finish navigation")
        
        // javascript response for query
        
        let javaScriptString : NSString = "var url='https://widget.locu.com/menuwidget/locu.widget.developer.v2.0.js?venue-id=19be3305c290ed06568a&widget-key=485cb65d3a738fb17b07a8a0bfaebb9827c9fdc9';var hm=document.createElement('script');hm.src = url;hm.id = '-locu-widget';document.getElementById('menu').appendChild(hm);"
        
        webView.evaluateJavaScript(javaScriptString as String, completionHandler: { (response : AnyObject?, error: NSError?) -> Void in
            
            print("Response: ")
            print(response)
            
            print("Error: ")
            print(error)
        })
        
    }
}
