//
//  DepthDataExtension.swift
//  Lumina
//
//  Created by Peter Salz on 15.02.18.
//  Copyright © 2018 Peter Salz. All rights reserved.
//

import Foundation
import AVFoundation

@available(iOS 11.0, *)
extension LuminaCamera: AVCaptureDepthDataOutputDelegate
{
    func depthDataOutput(_ output: AVCaptureDepthDataOutput,
                         didOutput depthData: AVDepthData,
                         timestamp: CMTime,
                         connection: AVCaptureConnection)
    {
        DispatchQueue.main.async
        {
            self.delegate?.depthDataCaptured(camera: self,
                                             depthData: depthData)
        }
    }
    
    func depthDataOutput(_ output: AVCaptureDepthDataOutput,
                         didDrop depthData: AVDepthData,
                         timestamp: CMTime,
                         connection: AVCaptureConnection,
                         reason: AVCaptureOutput.DataDroppedReason)
    {
        Log.error("dropped depth data output")
    }
}
