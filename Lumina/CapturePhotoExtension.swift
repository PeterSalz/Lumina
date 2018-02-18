//
//  CapturePhotoExtension.swift
//  Lumina
//
//  Created by Peter Salz on 15.02.18.
//  Copyright © 2018 Peter Salz. All rights reserved.
//

import Foundation
import AVFoundation

@available(iOS 11.0, *)
extension AVCapturePhoto
{
    func normalizedImage(forCameraPosition position: CameraPosition) -> UIImage?
    {
        Log.verbose("normalizing image from AVCapturePhoto instance")
        
        guard let cgImage = self.cgImageRepresentation()
        else { return nil }
        
        return UIImage(cgImage: cgImage.takeUnretainedValue(),
                       scale: 1.0,
                       orientation: getImageOrientation(forCamera: position))
    }
    
    private func getImageOrientation(forCamera: CameraPosition) -> UIImageOrientation
    {
        switch UIApplication.shared.statusBarOrientation
        {
        case .landscapeLeft:
            return forCamera == .back ? .down : .upMirrored
            
        case .landscapeRight:
            return forCamera == .back ? .up : .downMirrored
            
        case .portraitUpsideDown:
            return forCamera == .back ? .left : .rightMirrored
            
        case .portrait:
            return forCamera == .back ? .right : .leftMirrored
            
        case .unknown:
            return forCamera == .back ? .right : .leftMirrored
        }
    }
}
