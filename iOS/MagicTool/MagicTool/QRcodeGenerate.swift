//
//  QRcodeGenerate.swift
//  MagicTool
//
//  Created by thinkpower on 2021/6/22.
//

import Foundation
import UIKit
import CoreImage

public class QRcodeGenerate
{
   public func generateQRCode(from qrcodestring: String) -> UIImage? {

        let data = qrcodestring.data(using: .utf8);
        var uiImage: UIImage?
        if let filter = CIFilter(name: "CIQRCodeGenerator",
                                 parameters: ["inputMessage": data,
                                              "inputCorrectionLevel": "L"]) {

            if let outputImage = filter.outputImage,
                let cgImage = CIContext().createCGImage(outputImage,
                                                        from: outputImage.extent) {
                let size = CGSize(width: outputImage.extent.width * 3.0,
                                  height: outputImage.extent.height * 3.0)
                UIGraphicsBeginImageContext(size)
                if let context = UIGraphicsGetCurrentContext() {
                    context.interpolationQuality = .none
                    context.draw(cgImage,
                                 in: CGRect(origin: .zero,
                                            size: size))
                    uiImage = UIGraphicsGetImageFromCurrentImageContext()
                }
                UIGraphicsEndImageContext()
            }
        }
        return uiImage
    }
    
}
