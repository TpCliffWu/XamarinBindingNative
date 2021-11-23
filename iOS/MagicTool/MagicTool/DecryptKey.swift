//
//  DecryptKey.swift
//  SwiftUISample
//
//  Created by thinkpower on 2021/7/26.
//


import Foundation
import Security
import UIKit

// ECDHDecrypt解密
public class ECDHDecrypt{
    
    let fileName = "digicyapp";
    
    // 測試用 先寫入自訂私鑰再進行解密
    public func AddPriKeyTestDecrypt(guid:String,encryptedHmacKey:String,publicKey:String,privateKey:String)->String
    {
        var moneyBags = Array<MoneyBag>();
        
        // 讀取已存在資料
        let jsonData = try! LocalStorage.LoadJSON(withFilename: fileName);
        if (jsonData != nil)
        {
            let decoder = JSONDecoder();
            
            let _jsonData = jsonData!;
            
            let oldmoneyBags = try? decoder.decode([MoneyBag].self, from: _jsonData);
            
            if(oldmoneyBags != nil)
            {
                var _oldMoneyBags = oldmoneyBags!;
                _oldMoneyBags = _oldMoneyBags.filter{$0.guid != guid};
                
                moneyBags = _oldMoneyBags;
            }
        }
        let newMoneyBag = MoneyBag(guid: guid, publicKey: publicKey, privateKey: privateKey);
        moneyBags.append(newMoneyBag)
        let encoder = JSONEncoder();
        let data = try! encoder.encode(moneyBags);
        
        // 將新產生的公私鑰加入json檔
        _ = try! LocalStorage.SaveJson(jsonData: data, filename: fileName)
        
        return Decrypt(guid: guid, encryptedHmacKey: encryptedHmacKey,publicKey: publicKey)
        
    }
    
    
    // ecdhmackey解密
    public func Decrypt(guid:String,encryptedHmacKey:String,publicKey:String) -> String {
        
        let tag = "[ECDHDecrypt] ";
        var error: Unmanaged<CFError>?;
        
        do{
            var userPrivateKey = "";
            
            // 讀取私鑰
            print(tag + "load privateKey:");
            let jsonData = try! LocalStorage.LoadJSON(withFilename: fileName);
            
            if (jsonData == nil)
            {
                print(tag + "load file failed:");
                return "";
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
                    userPrivateKey = _moneyBag?.privateKey as! String;
                    

                }else{
                    print(tag + "file not cotain guid:");
                    return "";
                }
            }
            
            var platformPublicKey = publicKey;
            
            platformPublicKey = platformPublicKey.replace(target: "-----BEGIN PUBLIC KEY-----", withString: "");
            platformPublicKey = platformPublicKey.replace(target: "-----END PUBLIC KEY-----", withString: "");
            
            print(tag + "PlatformPublicKey:" + platformPublicKey);
            
            userPrivateKey = userPrivateKey.replace(target: "-----BEGIN PRIVATE KEY-----", withString: "");
            userPrivateKey = userPrivateKey.replace(target: "-----END PRIVATE KEY-----", withString: "");
            userPrivateKey = userPrivateKey.replace(target: "-----BEGIN EC PRIVATE KEY-----", withString: "");
            userPrivateKey = userPrivateKey.replace(target: "-----END EC PRIVATE KEY-----", withString: "");
            print(tag + "UserPrivateKey:" + userPrivateKey);
            
            
            let attributesECPri: [String:Any] = [
                kSecAttrKeyType as String: kSecAttrKeyTypeEC,
                kSecAttrKeyClass as String: kSecAttrKeyClassPrivate,
                kSecAttrKeySizeInBits as String: 256,
                kSecAttrIsPermanent as String: false
            ]
            
            let attributesECPub: [String:Any] = [
                kSecAttrKeyType as String: kSecAttrKeyTypeEC,
                kSecAttrKeyClass as String: kSecAttrKeyClassPublic,
                kSecAttrKeySizeInBits as String: 256,
                kSecAttrIsPermanent as String: false
            ]
            
            let privateKeyPem = userPrivateKey;
            let priKeyECData = Data(base64Encoded: privateKeyPem, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)
            let priKeyECStriped = priKeyECData![(priKeyECData?.count)!-65..<(priKeyECData?.count)!] + priKeyECData![36..<68]
            let privateKeySec = SecKeyCreateWithData(Data.init(_: priKeyECStriped) as CFData, attributesECPri as CFDictionary, &error)
            
            let pubicKeyPem = platformPublicKey
            let pubKeyECData = Data(base64Encoded: pubicKeyPem, options: Data.Base64DecodingOptions.ignoreUnknownCharacters)
            let pubKeyECStriped = pubKeyECData![(pubKeyECData?.count)!-65..<(pubKeyECData?.count)!]
            let publicKeySec = SecKeyCreateWithData(Data.init(_: pubKeyECStriped) as CFData, attributesECPub as CFDictionary, &error)
            
            
            
            let dict: [String: Any] = [:]
            
            guard let secretKeyData = SecKeyCopyKeyExchangeResult(privateKeySec!,
                                                                  SecKeyAlgorithm.ecdhKeyExchangeStandard,
                                                                  publicKeySec!,
                                                                  dict as CFDictionary, &error) else {
                print("#Error");
                if let err = error as? Error {
                    print(err);
                }
                return ""
            }
            
            
            let secretKeyString = ConvertTool.hexEncodedString(data: secretKeyData as Data);
            print(tag + "SecretKey" + secretKeyString)
            
            /// AES解密
            let aes = try AES(key: (secretKeyData as Data).bytes, blockMode: ECB())
            let data = ConvertTool.dataWithHexString(hex: encryptedHmacKey);
            let decrypted1 = try aes.decrypt(data.bytes);
            
            let finalS = ConvertTool.hexEncodedString(data: Data(decrypted1))
            print(tag + "HmacKey:" + finalS);
            return finalS;
            
            
        }catch{
        }
        return "";
        
    }
    
}


