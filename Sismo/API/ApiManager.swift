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
    private let acopios_url  = "https://script.googleusercontent.com/macros/echo?user_content_key=xRvxSqGDwWo0ansJohHHaOYPomidK_8j_oVFCWCMQmQYrySNXXhPX7yuruwUfWFvSeJaJ5FC8mDM7CN6MSdW1c95ZvWOgIShm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnOBXvm88s4kcVlUgpIxxI2X0CsK-VibkbdI1W84CsX9EGJrILcurRZJK5PMVD4CvF7xy_u9Yn2NR&lib=M_1Eu3tZF8s-WdtiFAYqlFCcXir-xNXZ_"
    static let shared = ApiManager()
    let sessionManager = Alamofire.SessionManager.default
    
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
    
    func getAcopios2(_ completion: @escaping ((_ data:NSArray, _ result:Bool) -> Void)){
    
        sessionManager.request( acopios_url)
            .responseJSON { response in
                switch response.result {
                case .success:
                   
                    completion(response.result.value as! NSArray, true)
                case .failure(let error):
                    let auxArray = NSArray ()
                    completion(auxArray, false)
                }
                
        }
    
    }
    
    
    
    
}
