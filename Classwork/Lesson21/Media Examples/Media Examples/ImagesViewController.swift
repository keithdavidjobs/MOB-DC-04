//
//  ImagesViewController.swift
//  Media Examples
//
//  Created by Shalev on 12/14/15.
//  Copyright © 2015 Keith. All rights reserved.
//

import UIKit
import MobileCoreServices

class ImagesViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var saveButton: UIButton!
    
    var tempOrientation: UIDeviceOrientation = UIDeviceOrientation.Unknown
    
    var imageToSave: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.saveButton.alpha = 0
        self.saveButton.hidden = true
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

    @IBAction func takePic(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        {
            print("loaded camera")
            self.tempOrientation = UIDevice.currentDevice().orientation
            let imageController = UIImagePickerController()
            imageController.delegate = self
            imageController.sourceType = .Camera
            
            imageController.mediaTypes = [kUTTypeImage as String]
            
            self.presentViewController(imageController, animated: true, completion: nil)
        }
    }
    
    @IBAction func loadPic(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .PhotoLibrary
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func savePic(sender: AnyObject) {
        print("save is running")
//        var dataProvider = CGDataProviderCreateWithCFData(exifAttach)
//        var cgImageRef = CGImageCreateWithJPEGDataProvider(dataProvider, nil, true, CGColorRenderingIntent.RenderingIntentDefault)
//        UIImageWriteToSavedPhotosAlbum(UIImage(CGImage: cgImageRef!), nil, nil, nil)
        UIImageWriteToSavedPhotosAlbum(self.imageToSave!, self, nil, nil)
        UIView.animateWithDuration(1) { () -> Void in
            self.saveButton.alpha = 0
        }
    }
    
    func hideButton()
    {
        print("hide button")
        self.saveButton.hidden = true
    }
    
    func updateDisplayImage(image: UIImage)
    {
        self.imageContainer.subviews.forEach({ $0.removeFromSuperview() })
        
        let imageView = UIImageView()
        imageView.frame = CGRectMake(0, 0, self.imageContainer.bounds.size.width, self.imageContainer.bounds.size.height)
        imageView.clipsToBounds = true
        imageView.contentMode = .ScaleAspectFill
        imageView.image = image
        
        self.imageContainer.addSubview(imageView)
        
    }
    
}

extension ImagesViewController: UIImagePickerControllerDelegate
{
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        print("Camera picture delegation is running")
        
        if let checkedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            let newImage = CIImage(image: checkedImage)
            let filter = CIFilter(name: "CISepiaTone")
            filter?.setValue(newImage, forKey: kCIInputImageKey)
            filter?.setValue(0.9, forKey: kCIInputIntensityKey)
            
//            let filteredImage = UIImage(CIImage: (filter?.outputImage)!)
//            updateDisplayImage(filteredImage)
            switch self.tempOrientation
            {
                case .Portrait:
                    print("portrait")
//                    let filteredImage = UIImage(CGImage: (filter?.outputImage)!, scale: 1.0, orientation: UIImageOrientation.Up)
                    let filteredImage = UIImage(CIImage: (filter?.outputImage)!, scale: 1.0, orientation: UIImageOrientation.Up)
                    self.imageToSave = filteredImage
                    updateDisplayImage(filteredImage)
                    //let filteredImage = UIImage(CGImage: (filter?.outputImage)!, scale: 1.0, orientation: UIImageOrientation.Up)
                case .LandscapeLeft, .LandscapeRight:
                    print("landscape")
                    let filteredImage = UIImage(CIImage: (filter?.outputImage)!, scale: 1.0, orientation: UIImageOrientation.Left)
                    self.imageToSave = filteredImage
                    updateDisplayImage(filteredImage)
                default:
                    print("default")
                    let filteredImage = UIImage(CIImage: (filter?.outputImage)!, scale: 1.0, orientation: UIImageOrientation.Left)
                    self.imageToSave = filteredImage
                    updateDisplayImage(filteredImage)
                
                
                
            }
            
            UIView.animateWithDuration(1, animations: { () -> Void in
                self.saveButton.hidden = false
                self.saveButton.alpha = 1
            })
//            let filteredImage = UIImage(CGImage: (filter?.outputImage)!, scale: 1.0, orientation: self.tempOrientation as? UIImageOrientation)
            //let filteredImage = UIImage(CIImage: (filter?.outputImage)!, scale: CGFloat(1), orientation: self.tempOrientation)
//            let filteredImage = UIImage(CIImage: (filter?.outputImage)!, scale: 1, orientation: self.tempOrientation)
            
        }
        self.dismissViewControllerAnimated(false, completion: nil)
    }
}
