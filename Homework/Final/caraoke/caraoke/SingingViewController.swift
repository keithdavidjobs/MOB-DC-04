//
//  SingingViewController.swift
//  caraoke
//
//  Created by Shalev on 12/21/15.
//  Copyright © 2015 Keith. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class SingingViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var finishButton: UIButton!
    var videoID: String!
    @IBOutlet weak var doneLabel: UILabel!
    
    var captureSession = AVCaptureSession()
    var captureVideoInput: AVCaptureDeviceInput?
    var captureAudioInput: AVCaptureDeviceInput?
    var captureMovieOutput = AVCaptureMovieFileOutput()
    var delegate : AVCaptureFileOutputRecordingDelegate?
    var capturePreview: AVCaptureVideoPreviewLayer?
    
    var isRecording: Bool = false
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tempURL = NSURL(string: "http://www.lifeofpeaceful.com/test.php?videoID=\(self.videoID)")
        let tempRequest = NSURLRequest(URL: tempURL!)
        self.webView.loadRequest(tempRequest)
        self.finishButton.hidden = true
        self.webView.delegate = self
        self.doneLabel.hidden = true
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "playDone:", name: AVPlayerItemDidPlayToEndTimeNotification, object: nil)
        configureSession()
        startRecording()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print("started load")
        if request.URL?.scheme == "callback"
        {
            print("scheme: \(request.URL?.scheme)")
            return false
        }
        return true
    }
    
    func callStop()
    {
        print("stop")
    }
    
    func playDone(notification: NSNotification)
    {
        stopRecording()
        print("done playing")
    }
    
    func failedToFinish(notification: NSNotification)
    {
        print("failed to finish")
    }
    
    func configureSession()
    {
        let devices = AVCaptureDevice.devices()
        for device in devices
        {
            print(device)
            if device.hasMediaType(AVMediaTypeVideo)
            {
                if device.position == AVCaptureDevicePosition.Front
                {
                    do
                    {
                        self.captureVideoInput = try AVCaptureDeviceInput(device: device as! AVCaptureDevice)
                    }
                    catch let error as NSError
                    {
                        print("error setting captureVideoInput: \(error)")
                    }
                }
            }
            else if device.hasMediaType(AVMediaTypeAudio)
            {
                do
                {
                    self.captureAudioInput = try AVCaptureDeviceInput(device: device as! AVCaptureDevice)
                }
                catch let error as NSError
                {
                    print("error setting captureAudioInput: \(error)")
                }
            }
        }
        
        
        //Add the video, audio, an movie inputs/output to the session
        if self.captureSession.canAddInput(self.captureVideoInput)
        {
            self.captureSession.addInput(self.captureVideoInput)
        }
        if self.captureSession.canAddInput(self.captureAudioInput)
        {
            self.captureSession.addInput(self.captureAudioInput)
        }
        if self.captureSession.canAddOutput(self.captureMovieOutput)
        {
            self.captureSession.addOutput(self.captureMovieOutput)
        }
        
        self.captureSession.sessionPreset = AVCaptureSessionPresetHigh
        //self.captureSession.startRunning()
        self.delegate = VideoDelegate()
    }
    
    func stopRecording()
    {
        self.isRecording = false
        self.captureMovieOutput.stopRecording()
        self.captureSession.stopRunning()
        self.webView.hidden = true
        self.finishButton.hidden = false
        self.doneLabel.hidden = false
    }
    
    func startRecording()
    {
        self.isRecording = true
        if checkIfTempMovieExists()
        {
            removeTempMovieFile()
        }
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! NSString
        let outputPath = "\(documentsPath)/output.mov"
        let tempFileUrl = NSURL(fileURLWithPath: outputPath)
//            self.capturePreview = AVCaptureVideoPreviewLayer(session: self.captureSession)
        //self.capturePreview!.frame = CGRectMake(0, 0, self.previewView.bounds.width, self.previewView.bounds.height)
        //self.previewView.layer.addSublayer(self.capturePreview!)
        
        //Start the session
        self.captureSession.startRunning()
        
        self.captureMovieOutput.startRecordingToOutputFileURL(tempFileUrl, recordingDelegate: delegate)
    }
    
    func checkIfTempMovieExists() -> Bool
    {
        var returnVal = false
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! NSString
        let tempOut = "\(documentsPath)/output.mov"
        
        if NSFileManager.defaultManager().fileExistsAtPath(tempOut)
        {
            returnVal = true
        }
        return returnVal
    }
    
    func removeTempMovieFile()
    {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! NSString
        let tempOut = "\(documentsPath)/output.mov"
        do
        {
            try NSFileManager.defaultManager().removeItemAtPath(tempOut)
            print("file was deleted successfully")
        }
        catch let error as NSError
        {
            print("error deleting the temporary file: \(error)")
        }
        
    }

    @IBAction func doneRecording(sender: AnyObject) {
        var searchVC = self.storyboard?.instantiateViewControllerWithIdentifier("mainVC") as! ViewController
        self.presentViewController(searchVC, animated: true, completion: nil)
    }

}
