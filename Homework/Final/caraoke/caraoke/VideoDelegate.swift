//
//  VideoDelegate.swift
//  caraoke
//
//  Created by Shalev on 12/21/15.
//  Copyright © 2015 Keith. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit
import Photos
import Alamofire


class VideoDelegate : NSObject, AVCaptureFileOutputRecordingDelegate
{

    
    
    func captureOutput(captureOutput: AVCaptureFileOutput!, didFinishRecordingToOutputFileAtURL outputFileURL: NSURL!, fromConnections connections: [AnyObject]!, error: NSError!) {
        print("capture output : finish recording to \(outputFileURL)")
        if error != nil
        {
            print("error finishing recording (delegate): \(error)")
            var val = error.userInfo[AVErrorRecordingSuccessfullyFinishedKey]
            if val != nil
            {
                print("Did recording finish successfully?? => val: \(val?.boolValue)")
            }
        }
        let tempFile = String(outputFileURL)
        
        switch PHPhotoLibrary.authorizationStatus()
        {
            case .NotDetermined:
                print("photolibrary authorization status NOT DETERMINED")
                PHPhotoLibrary.requestAuthorization({ (tempStatus) -> Void in
                    switch tempStatus
                    {
                        case .Authorized:
                            print("thanks")
                            self.saveToLibraray(outputFileURL)
                        case .Denied:
                            print("denied")
                        case .Restricted:
                            print("restriced")
                        case .NotDetermined:
                            print("not determined")
                        default:
                            print("huh?")
                    }
                })
            case .Denied:
                print("photolibrary authorization status DENIED")
            case .Authorized:
                print("photolibrary authorization status AUTHORIZED")
                self.saveToLibraray(outputFileURL)
            case .Restricted:
                print("photolibrary authorization status RESTRICTED")
            default:
                print("nothing")
        }
    }
    
    func saveToLibraray(fileURL: NSURL)
    {
        PHPhotoLibrary.sharedPhotoLibrary().performChanges({ () -> Void in
                let request = PHAssetChangeRequest.creationRequestForAssetFromVideoAtFileURL(fileURL)
            }) { (boolValue, error) -> Void in
                print("error: \(error)")
                print("boolValue: \(boolValue)")
        }
        
        
        let fileName = "output.avi"
        Alamofire.upload(.POST, "http://www.lifeofpeaceful.com/upload.php?fileName=\(fileName)", file: fileURL).progress({ (bytesWritten, totalWritten, totalExpected) -> Void in
                //print("total written: \(totalWritten)")
                //print("total expected: \(totalExpected)")
                //print("bytes written: \(bytesWritten)")
                dispatch_async(dispatch_get_main_queue()){
                    //print("total bytes written on main queue: \(totalWritten)")
                    //print("bytes written on main queue: \(bytesWritten)")
                }
            }).responseJSON(completionHandler: { (response) -> Void in
                print("response: \(response)")
                
            })
        
    }
    
    func captureOutput(captureOutput: AVCaptureFileOutput!, didStartRecordingToOutputFileAtURL fileURL: NSURL!, fromConnections connections: [AnyObject]!) {
        print("capture output: started recording to \(fileURL)")
    }
    
}