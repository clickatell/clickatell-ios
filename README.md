# API integration for iOS (Swift/Objective-C) 

* [Introduction](#Introduction)
* [Libraries](#Libraries)
* [Usage](#usage)
* [Extendability](#Extendability)




## Introduction
The aim of this document is to provide a kickstart for developers to integrate the Clickatell HTTP and REST APIs into their iOS development. This document will provide basic code snippets that can be used in conjunction with the libraries included

##Libraries
Each of the APIs has their own library class file. Within these files the various api calls are setup and processed. At the top of the class the developer account credentials needs to be set. These variables are:

 - BaseUrl
 - Username (HTTP ONLY)
 - Password (HTTP ONLY)
 - ApiId (HTTP ONLY)
 - AuthKey (REST ONLY)

 In the event that you want to make use of on device storage or want to manually enter it each time, this can also be done by nesting these library classes into the file that you would like to se the credentials and then simply updating the variables. Alternatively, just hard code these into the library file.

## Usage
in order to use these libraries, you will need to instantiate them within the page you want to use them. It is advised that the link be done directly below the class instantiation before any methods are envoked.  Once linked, you will be able to update variables and execute calls as required.
####Sample Code
**HTTP API**
- Instantiation of library

```
class MessageSendViewController: UIViewController {  
	var HttpApiCall = ClickatellHttpApi()
```

 - Account Balance
```
self.HttpApiCall.GetCreditBalance()
self.HttpApiCall.ProcessRequest()
```
 
- Send Message
```
self.HttpApiCall.ToInput = "[REPLACE WITH MSISDN]"
self.HttpApiCall.MessageInput = "[REPLACE WITH MESSAGE]"
self.HttpApiCall.SendMessage()
self.HttpApiCall.ProcessRequest()
```

- Stop Message

```
self.HttpApiCall.MessageId = "[REPLACE WITH MESSAGE ID]"
self.HttpApiCall.StopMessage();
self.HttpApiCall.ProcessRequest()
```
- Message Status

```
self.HttpApiCall.MessageId = "[REPLACE WITH MESSAGE ID]"
self.HttpApiCall.GetMessageStatus()
self.HttpApiCall.ProcessRequest()
```
- Message Charge

```
self.HttpApiCall.MessageId = "[REPLACE WITH MESSAGE ID]"
self.HttpApiCall.GetMessageCharge();
self.HttpApiCall.ProcessRequest()
```
- Coverage

```
self.HttpApiCall.Msisdn = "[REPLACE WITH MSISDN]"
self.HttpApiCall.GetCoverage();
self.HttpApiCall.ProcessRequest()
```


**REST API**

 - Instantiation of library

```
class MessageSendViewController: UIViewController {  
	var RestApiCall = ClickatellRestApi()
```

 - Account Balance
```
self.RestApiCall.GetCreditBalance()
self.RestApiCall.ProcessRequest()
```
 
- Send Message
```
self.RestApiCall.Params = ["text":"[REPLACE WITH MESSAGE]", "to":["[REPLACE WITH MSISDN"]]
self.RestApiCall.SendMessage()
self.RestApiCall.ProcessRequest()
```

- Stop Message

```
self.RestApiCall.MessageId = "[REPLACE WITH MESSAGE ID]"
self.RestApiCall.StopMessage();
self.RestApiCall.ProcessRequest()
```
- Message Status

```
self.RestApiCall.MessageId = "[REPLACE WITH MESSAGE ID]"
self.RestApiCall.GetMessageStatus()
self.RestApiCall.ProcessRequest()
```
- Message Charge

```
self.RestApiCall.MessageId = "[REPLACE WITH MESSAGE ID]"
self.RestApiCall.GetMessageCharge();
self.RestApiCall.ProcessRequest()
```
- Coverage

```
self.RestApiCall.Msisdn = "[REPLACE WITH MSISDN]"
self.RestApiCall.GetCoverage();
self.RestApiCall.ProcessRequest()
```


## Extendability
As mentioned at the start of this document, this is only meant as a kickstart into integration of the basic functionality of the Clickatell APIs into your iOS developement. Each of the libraries can be extended to cater for more functionality available in the APIs. 

For more information on the various API features, navigate to the links below:

[HTTP][1]
[REST][2]

[1]: https://www.clickatell.com/apis-scripts/apis/http-s/
[2]: https://www.clickatell.com/apis-scripts/apis/rest/


