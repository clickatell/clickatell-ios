//
//  ClickatellRestApi.swift
//  Clickatell Messanger
//
//

import Foundation

class ClickatellRestApi {
    //Account Credentials with Base URL
    var BaseUrl = "https://api.clickatell.com/rest/"
    var AuthKey = "[REPLACE WITH AUTHKEY]"
    var ApiId = "[REPLACE WITH APIID]"
    var Method = "GET"
    
    //Variables that are used within this class
    var Msisdn = ""
    var ToInput = ""
    var MessageInput = ""
    
    //If used, below variable must start with '&' or else the query will fail
    var CustomParameters = ""
    var MessageId = ""
    var StringData = ""
    var ArrayData = []
    var QueryString = ""
    
    //Take note that the to parameter needs to be passed as an array
    var Params = ["text": "", "to": []]
    
    //Send message with specified ToInput and MessageInput.
    func SendMessage () {
        // Ensure that there are now spaces in the message query. Replace all spaces with + signs
        self.MessageInput = self.MessageInput.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.CaseInsensitiveSearch, range: nil)
        
        self.QueryString = "message"
        self.Method = "POST"
        
        
    }
    
    //Get credit balance for specified user account
    func GetCreditBalance() {
        self.QueryString = "account/balance"
    }
    
    //Get the status for the given message id (apimsgid)
    func GetMessageStatus () {
        self.QueryString = "message/"+self.MessageId
    }
    
    //Get the charge for the given message id (apimsgid)
    func GetMessageCharge () {
        self.QueryString = "http/getmsgcharge?apimsgid="+self.MessageId+"&"
    }
    
    //Stop the message for the given message id (apimsgid)
    func StopMessage () {
        self.QueryString = "message/"+self.MessageId
        self.Method = "DELETE"
    }
    
    //Check the coverage of a network or number
    func GetCoverage () {
        self.QueryString = "coverage/"+self.Msisdn
    }
    
    //Process the API request
    func ProcessRequest () {
        var request = NSMutableURLRequest()
        let urlStr = self.BaseUrl+self.QueryString
        
        request.URL = NSURL(string: urlStr)
        request.HTTPMethod = self.Method
        request.addValue("Bearer "+self.AuthKey, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("1", forHTTPHeaderField: "X-Version")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        if (self.Method == "POST") {
            let body : Dictionary = self.Params
            var e : NSError?
            let opt : NSJSONWritingOptions = nil
            let bodyData = NSJSONSerialization.dataWithJSONObject(body, options:opt, error:&e)
            request.HTTPBody = bodyData
        }
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
            if (error != nil) {
                println(error)
            } else {
                if let newObj = NSJSONSerialization.JSONObjectWithData(data, options:nil, error: nil) as? NSDictionary {
                    println(newObj)
                    var urlContent = (NSString(data: data, encoding: NSUTF8StringEncoding))
                    var content = urlContent! as String
                    
                    self.StringData = content
                }

            }
        }
        task.resume()
    }
    
    
}
