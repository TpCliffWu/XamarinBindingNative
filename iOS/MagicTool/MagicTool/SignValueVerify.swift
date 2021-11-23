//
//  SignValueVerify.swift
//  NativeiOS
//
//  Created by thinkpower on 2021/6/8.
//

import Foundation

public class SignValueVerify{
    
    public func Verify( guid:String,  plainText:String,  signText:String)-> Bool {
        
        let tag = "[Verify] ";

        let fileName = "digicyapp";
        var publicKey = "";
        
        // 讀取公私鑰
        let jsonData = try! LocalStorage.LoadJSON(withFilename: fileName);
        
        if (jsonData == nil)
        {
            print(tag + "#Error Can't find files")
            return false;
        }
        
        let decoder = JSONDecoder();
        
        let _jsonData = jsonData!;
        
        let oldmoneyBags = try? decoder.decode([MoneyBag].self, from: _jsonData);
        
        if(oldmoneyBags != nil)
        {
            let _oldMoneyBags = oldmoneyBags!;
            
            if(_oldMoneyBags.filter{$0.guid == guid}.count > 0)
            {
                // 有相同guid 回傳公鑰
                let _moneyBag = _oldMoneyBags.filter{$0.guid == guid}.first;
                publicKey = _moneyBag?.publicKey as! String;
//                privateKey = _moneyBag?.privateKey as! String;
//                print(tag + "PrivateKey: " + privateKey);
//                print(tag + "PublicKey: " + publicKey);

            }else{
                print(tag + "#Error Can't find files")
                return false;
            }
        }

        return ECSignatureVerify(publicKey: publicKey, plainText: plainText, signText: signText);
    }
    
    func ECSignatureVerify(publicKey:String,plainText:String,  signText:String)->Bool
    {
        let signTextData = ConvertTool.dataWithHexString(hex: signText);
        let publicKey = try! ECPublicKey(key: publicKey);
        let signature = try! ECSignature.init(asn1: signTextData);
        let valid = signature.verify(plaintext: plainText, using: publicKey);
        
        return valid;
    }
    
}
