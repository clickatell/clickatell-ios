//
//  MessageSendViewController.swift
//  ClickatellSingleApiCall
//
//  Created by Fred Lowe on 2014/12/29.
//  Copyright (c) 2014 Fred Lowe. All rights reserved.
//

import UIKit

class MessageSendViewController: UIViewController {
    
    @IBOutlet weak var PlaceholderText: UILabel!
    var HttpApiCall = ClickatellHttpApi()
    var RestApiCall = ClickatellRestApi()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //self.ProcHttpApi()
        self.ProcRestApi()
    }
    
    func ProcHttpApi() {
        self.HttpApiCall.ToInput = "27842922225"
        self.HttpApiCall.MessageInput = "HTTP API Test Message"
        //self.HttpApiCall.CustomParameters = "&deliv_time=10"
        self.HttpApiCall.SendMessage()
        self.HttpApiCall.ProcessRequest()
        
        sleep(2)
        var content = self.HttpApiCall.Data;
        self.PlaceholderText.text = content
    }
    
    func ProcRestApi() {
        self.RestApiCall.Params = ["text":"REST API Test Message", "to":["27842922225"]]
        self.RestApiCall.SendMessage()
        self.RestApiCall.ProcessRequest()
        
        sleep(2)
        var content = self.RestApiCall.StringData;
        self.PlaceholderText.text = content
        
    }
    
    @IBAction func CancelTapped(sender: AnyObject) {
        //Return To Previous Page
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
