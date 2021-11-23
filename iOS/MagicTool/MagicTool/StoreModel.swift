//
//  StoreModel.swift
//  NativeiOS
//
//  Created by thinkpower on 2021/6/8.
//

import Foundation

public class StoreModel : Codable{
    
    let Guid: String
    
    let HmacKey: String
    
    init(guid: String, HmacKey: String) {
        self.Guid = guid;
        self.HmacKey = HmacKey;
    }
}
