//
//  ExtensionFunction.swift
//  SwiftUISample
//
//  Created by thinkpower on 2021/8/3.
//

import Foundation

extension String
{
    func replace(target: String, withString: String) -> String
    {
    return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
        
}
