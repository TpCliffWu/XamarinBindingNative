//
//  PublicKeyGenerator.swift
//  NativeiOS
//
//  Created by thinkpower on 2021/6/8.
//

import Foundation

public class PublicKeyGenerator
{
    public func GetPub(guid:String)-> String {
        var moneyBags = Array<MoneyBag>();
        let fileName = "digicyapp";
        
        // 讀取檔案
        let jsonData = try! LocalStorage.LoadJSON(withFilename: fileName);
        
        if (jsonData != nil)
        {
            let decoder = JSONDecoder();
            
            let _jsonData = jsonData!;
            
            let oldmoneyBags = try? decoder.decode([MoneyBag].self, from: _jsonData);
            
            if(oldmoneyBags != nil)
            {
                let _oldMoneyBags = oldmoneyBags!;
                
                if(_oldMoneyBags.filter{$0.guid == guid}.count > 0)
                {
                    // 回傳公鑰
                    let mb = _oldMoneyBags.filter{$0.guid == guid}[0];
                    return mb.publicKey;
                }
            }
        }
        
        
        
        
        // 產生私鑰
        let p256PrivateKey = try! ECPrivateKey.make(for: .prime256v1)
        let privateKeyPEM = p256PrivateKey.pemString;
        //let privateKey:String = Data(privateKeyPEM.utf8).base64EncodedString();
        let privateKey = String(privateKeyPEM);
        
        // 產生公鑰
        let p256PublicKey = try! p256PrivateKey.extractPublicKey();
        let publicKeyPEM = p256PublicKey.pemString;
        let publicKey = String(publicKeyPEM);
        
        
        // 新增儲存資料
        let newMoneyBag = MoneyBag(guid: guid, publicKey: publicKey, privateKey: privateKey);
        
        moneyBags.append(newMoneyBag);
        
        let encoder = JSONEncoder();
        let data = try! encoder.encode(moneyBags);
        
        // 將新產生的公私鑰加入json檔
        let result = try! LocalStorage.SaveJson(jsonData: data, filename: fileName)
        
        if(result){
            // 回傳公鑰
            return publicKey;
        }else{
            return "";
        }
    }
}
