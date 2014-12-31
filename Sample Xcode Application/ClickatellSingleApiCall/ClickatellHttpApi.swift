//
//  ClickatellHttpApi.swift
//  Clickatell Messanger
//
//  Created by Fred Lowe on 2014/12/27.
//  Copyright (c) 2014 Fred Lowe. All rights reserved.
//

import Foundation

class ClickatellHttpApi {
    //Account Credentials with Base URL
    var BaseUrl = "http://api.clickatell.com/"
    var Username = "[REPLACE WITH USERNAME]"
    var Password = "[REPLACE WITH PASSWORD]"
    var ApiId = "[REPLACE WITH APIID]"
    
    //Variables that are used within this class
    var Msisdn = ""
    var ToInput = ""
    var MessageInput = ""
    //If used, below variable must start with '&' or else the query will fail
    var CustomParameters = ""
    var MessageId = ""
    var Data = ""
    var QueryString = ""
    
    //Send message with specified ToInput and MessageInput.
    func SendMessage () {
        // Ensure that there are now spaces in the message query. Replace all spaces with + signs
        self.MessageInput = self.MessageInput.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        
        self.QueryString = "http/sendmsg?to="+self.ToInput+"&text="+self.MessageInput+self.CustomParameters+"&"
       
    }
    
    //Get credit balance for specified user account
    func GetCreditBalance() {
        self.QueryString = "http/getbalance?"
    }
    
    //Get the status for the given message id (apimsgid)
    func GetMessageStatus () {
        self.QueryString = "http/querymsg?apimsgid="+self.MessageId+"&"
    }
    
    //Get the charge for the given message id (apimsgid)
    func GetMessageCharge () {
        self.QueryString = "http/getmsgcharge?apimsgid="+self.MessageId+"&"
    }
    
    //Stop the message for the given message id (apimsgid)
    func StopMessage () {
        self.QueryString = self.BaseUrl+"http/delmsg?api_id="+self.ApiId+"&user="+self.Username+"&password="+self.Password+"&apimsgid="+self.MessageId
    }
    
    //Check the coverage of a network or number
    func GetCoverage () {
        self.QueryString = "utils/routecoverage?msisdn="+self.Msisdn+"&"
    }
    
    //Process the API request
    func ProcessRequest () {
        //Construct URL
        let url = NSURL(string: self.BaseUrl+self.QueryString+"api_id="+self.ApiId+"&user="+self.Username+"&password="+self.Password)
        
        //Process request via NSURLSession and then output result to global variable for later use
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
            var urlContent = (NSString(data: data, encoding: NSUTF8StringEncoding))
            var content = urlContent! as String
           
            self.Data = content
        }
      
        task.resume()
    }

    
}
