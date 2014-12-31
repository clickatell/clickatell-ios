//
//  AccountBalanceViewController.swift
//  ClickatellSingleApiCall
//
//  Created by Fred Lowe on 2014/12/29.
//  Copyright (c) 2014 Fred Lowe. All rights reserved.
//

import UIKit

class AccountBalanceViewController:UIViewController {
    
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
        self.HttpApiCall.GetCreditBalance();
        self.HttpApiCall.ProcessRequest();
        
        sleep(2)
        var content = self.HttpApiCall.Data;
        self.PlaceholderText.text = content
    }
    
    func ProcRestApi() {
        self.RestApiCall.GetCreditBalance()
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
