//
//  ApiManager.swift
//  Sismo
//
//  Created by Alberto Huerdo on 9/21/17.
//  Copyright © 2017 huerdo. All rights reserved.
//

import UIKit
import Alamofire

class ApiManager: NSObject {
    
    private let url = "https://acopio-api.skycatch.net/v1/"    
    
    static let shared = ApiManager()
    
    
    func getAcopios(_ completion: @escaping (_ response: String, _ error: Error?) -> Void) {
        
        
        Alamofire.request("\(url)acopios").validate().responseJSON { response in
            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
            }
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
                
                
                 completion(utf8Text, nil)
                
                
                
                
                
            }
        }
    }
    
    
    
}
