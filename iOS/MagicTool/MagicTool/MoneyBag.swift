//
//  MoneyBag.swift
//  NativeiOS
//
//  Created by thinkpower on 2021/6/8.
//

import Foundation

public class MoneyBag : Codable{
    let guid: String
    
    let publicKey: String
    
    let privateKey : String
    
    init(guid: String, publicKey: String, privateKey:String) {
        self.guid = guid
        self.publicKey = publicKey
        self.privateKey = privateKey
    }
}
