//
//  InstructionDataSign.swift
//  NativeiOS
//
//  Created by thinkpower on 2021/6/8.
//

import Foundation

public class InstructionDataSign {
    
    // 簽驗章 簽署憑證
    public func Sign( guid:String,  plainText:String)->String
    {
        let tag = "[Sign] ";
        let fileName = "digicyapp";
        let jsonFile = try! LocalStorage.LoadJSON(withFilename: fileName);
        if(jsonFile == nil)
        {
            print(tag + "#Error Can't find files")
            return "";
        }
        
      
        let decoder = JSONDecoder();
        let _jsonData = jsonFile!;
          
        let oldStoreKeys = try? decoder.decode([MoneyBag].self, from: _jsonData);

        guard let moneyBags:[MoneyBag] = oldStoreKeys else { return "" };
        
        // 有舊的檔案
        if(moneyBags.filter{$0.guid == guid}.count <= 0)
        {
            print(tag + "#Error Can't find files")
            return "";
        }
        
        // 有相同guid
        let _moneyBag = moneyBags.filter{$0.guid == guid}.first;
        
        //私鑰
        let privateKey:String = _moneyBag?.privateKey ?? "";
        
        if(privateKey.isEmpty){
            print(tag + "#Error Private Key is Empty");
            return ""
        }
      //  guard let _privateKeyData = Data(base64Encoded: privateKeyBase64) else { return "" };
      //   guard let privateKey:String = String(data: _privateKeyData, encoding: .utf8)  else { return "" };
    
        let ecPrivateKey = try! ECPrivateKey(key: privateKey);
        let signature:ECSignature = try! plainText.sign(with: ecPrivateKey);
        
        // 簽章值轉為字串
        let signData = signature.asn1;
        let signText = ConvertTool.hexEncodedString(data: signData);
        
        return signText;
    }
}
