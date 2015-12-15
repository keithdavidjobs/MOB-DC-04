//
//  VideosViewController.swift
//  Media Examples
//
//  Created by Shalev on 12/14/15.
//  Copyright © 2015 Keith. All rights reserved.
//

import UIKit
import MediaPlayer
import MobileCoreServices

class VideosViewController: UIViewController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func loadVideo(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum) == false
        {
            print("can't access media library")
            return
        }
        
        let vidController = UIImagePickerController()
        vidController.sourceType = .SavedPhotosAlbum
        vidController.mediaTypes = [kUTTypeMovie as String]
        vidController.allowsEditing = true
        vidController.delegate = self
        
        presentViewController(vidController, animated: true, completion: nil)
    }

    @IBAction func recordAndSaveVideo(sender: AnyObject) {
    }
    
}

extension VideosViewController: UIImagePickerControllerDelegate
{
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        //code
        let mediaType = info[UIImagePickerControllerMediaType] as! NSString
        dismissViewControllerAnimated(true) { () -> Void in
            //code
            if mediaType == kUTTypeMovie
            {
                let moviePlayer = MPMoviePlayerViewController(contentURL: info[UIImagePickerControllerMediaURL] as! NSURL)
                self.presentMoviePlayerViewControllerAnimated(moviePlayer)
            }
        }
    }
}