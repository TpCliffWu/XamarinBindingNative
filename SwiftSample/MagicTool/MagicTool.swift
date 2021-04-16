//
//  MagicTool.swift
//  MagicTool
//
//  Created by thinkpower on 2021/4/13.
//

import Foundation
@objc(MagicTool)
public class MagicTool:NSObject{
    
    // 回傳文字
    @objc
    public func GetString()->String{
        
        return "Hello Magic!";
    }
    
    // 陣列加總
    @objc
    public func MathIntAddition(intArray:[Int])->Int{
        
        var resp:Int = 0;
        for i in intArray
        {
            resp+=i;
        }
        return resp;
    }
    
    // 轉換成base64
    @objc
    public func StringToBase64(str:String)->String{
        
        let resp=Data(str.utf8).base64EncodedString();
        return resp;
    }
}
