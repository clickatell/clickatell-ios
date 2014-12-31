//
//  MessageStopViewController.swift
//  ClickatellSingleApiCall
//
//  Created by Fred Lowe on 2014/12/29.
//  Copyright (c) 2014 Fred Lowe. All rights reserved.
//

import UIKit

class MessageStopViewController: UIViewController {

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
        self.HttpApiCall.MessageId = "b3dd0904b81879c64c8dc50aac75cade"
        self.HttpApiCall.StopMessage();
        self.HttpApiCall.ProcessRequest();
        
        sleep(2)
        var content = self.HttpApiCall.Data;
        self.PlaceholderText.text = content
    }
    
    func ProcRestApi() {
        self.RestApiCall.MessageId = "f8fefb6ed8aa031175c75c1ccb1576fb"
        self.RestApiCall.StopMessage();
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
