//
//  MetadataOutputDelegateExtension.swift
//  Lumina
//
//  Created by Peter Salz on 15.02.18.
//  Copyright © 2018 Peter Salz. All rights reserved.
//

import Foundation
import AVFoundation

extension LuminaCamera: AVCaptureMetadataOutputObjectsDelegate
{
    func metadataOutput(_ output: AVCaptureMetadataOutput,
                        didOutput metadataObjects: [AVMetadataObject],
                        from connection: AVCaptureConnection)
    {
        Log.verbose("metadata detected - \(metadataObjects)")
        
        guard case self.trackMetadata = true else { return }
        
        DispatchQueue.main.async
        {
            self.delegate?.detected(camera: self, metadata: metadataObjects)
        }
    }
}
