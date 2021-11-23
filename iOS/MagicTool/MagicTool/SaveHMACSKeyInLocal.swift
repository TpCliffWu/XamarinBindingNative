//
//  SaveHMACKey.swift
//  NativeiOS
//
//  Created by thinkpower on 2021/6/8.
//

import Foundation

// 儲存HMACKey
public class SaveHMACSKeyInLocal{
    
    let fileName = "HMACKey";
    
    public func Save( guid:String,  hmacKey:String)->Void
    {
        let tag = "[Save HMACKey] "
        var storeKeys = Array<StoreModel>();
        
        // 讀取檔案
        let jsonData = try! LocalStorage.LoadJSON(withFilename: fileName);
        
        if (jsonData != nil)
        {
            let decoder = JSONDecoder();
            
            let _jsonData = jsonData!;
            
            let oldStoreKeys = try? decoder.decode([StoreModel].self, from: _jsonData);
            
            if(oldStoreKeys != nil)
            {
                var _oldStoreKeys = oldStoreKeys!;
                
                if(_oldStoreKeys.filter{$0.Guid == guid}.count > 0)
                {
                    // 去掉相同的guid
                    _oldStoreKeys = _oldStoreKeys.filter{$0.Guid != guid}
                }
                storeKeys += _oldStoreKeys;
            }
        }
        
        //新的HMACKey
        let newStoreKey = StoreModel(guid: guid, HmacKey: hmacKey);
        storeKeys.append(newStoreKey);
        
        // 轉換json物件
        let encoder = JSONEncoder();
        let data = try! encoder.encode(storeKeys);
        
        let convertedString = String(data: data, encoding: String.Encoding.utf8) ?? "";// the data will be converted to the string

        print (tag + "Save Result:" + convertedString);
        // 儲存json
        _ = try! LocalStorage.SaveJson(jsonData: data, filename: fileName);
    }
    
    // 用guid檢查是否有儲存key
    public func Check(guid:String)->Bool
    {
        let tag = "[HMACKey File Check] "
        let jsonData = try! LocalStorage.LoadJSON(withFilename: fileName);
        
        if (jsonData == nil)
        {
            print (tag + "File Not Found");
            return false;
        }
        
        let decoder = JSONDecoder();
        let _jsonData = jsonData!;
        
        let oldStoreKeys = try? decoder.decode([StoreModel].self, from: _jsonData);
        
        if(oldStoreKeys == nil)
        {
            print (tag + "File is Empty");
            return false;
        }
        
        let _oldStoreKeys = oldStoreKeys!;
        
        if(_oldStoreKeys.filter{$0.Guid == guid}.count > 0)
        {
            // 已經有有相同guid
            return true;
        }
        
        print (tag + "Guid Not Found");
        return false;
    }
    
    // 用guid 取得儲存的key
    public func Get(guid:String)->String
    {
        let tag = "[HMACKey Get] "
        let jsonData = try! LocalStorage.LoadJSON(withFilename: fileName);
        
        if (jsonData == nil)
        {
            print (tag + "File Not Found");
            return "";
        }
        
        let decoder = JSONDecoder();
        let _jsonData = jsonData!;
        
        let oldStoreKeys = try? decoder.decode([StoreModel].self, from: _jsonData);
        
        if(oldStoreKeys == nil)
        {
            print (tag + "File is Empty");
            return "";
        }
        
        let _oldStoreKeys = oldStoreKeys!;
        
        if(_oldStoreKeys.filter{$0.Guid == guid}.count > 0)
        {
            let key =  _oldStoreKeys.first(where: {$0.Guid == guid});
            let rhmackey:String! = key?.HmacKey;
            return rhmackey;
        }
        
        print (tag + "Guid Not Found");
        return "";
    }
}
