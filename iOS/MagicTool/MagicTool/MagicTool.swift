//
//  MagicTool.swift
//  MagicTool
//
//  Created by thinkpower on 2021/11/22.
//

import Foundation

public class MagicTool:NSObject
{
    // 1.開戶 產生公私鑰 回傳公鑰
    @objc
    public func GeneratePublicKey(guid:String)-> String {
        
        let pkGen = PublicKeyGenerator.init();
        return  pkGen.GetPub(guid: guid);
    }
    
    // 2.簽驗章 簽署憑證
    @objc
    public func Sign(guid:String,plainText:String)->String
    {
        let signData = InstructionDataSign.init();
        return signData.Sign(guid: guid, plainText: plainText);
    }
    
    // 3.簽驗章 回傳簽驗章是否正確
     @objc
     public func VerifySign(guid:String,plainText:String,signText:String) -> Bool{
         
         let signVerify = SignValueVerify.init();
         return signVerify.Verify(guid: guid, plainText: plainText, signText: signText)
     }
}
