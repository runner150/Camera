//
//  ViewController.swift
//  Camera
//
//  Created by Kyle Ettinger on 7/13/16.
//  Copyright © 2016 Kyle Ettinger. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var photoImageView :UIImageView!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
    @IBAction func openCameraButtonPressed() {
        
        let imagePickerViewController = UIImagePickerController()
        imagePickerViewController.delegate = self
        
        let alertController = UIAlertController(title: "Choose", message: nil, preferredStyle: .ActionSheet)
        
        let pickFromLibraryAction = UIAlertAction(title: "Pick from Library", style: .Default) { (alert :UIAlertAction) in
            
            imagePickerViewController.sourceType = .PhotoLibrary
            self.presentViewController(imagePickerViewController, animated: true, completion: nil)
            
            print("You selected to pick from library")
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Destructive) { (alert :UIAlertAction) in
            
            
        }
        
        let takeAPictureAction = UIAlertAction(title: "Take a picture", style: .Default) { (alert :UIAlertAction) in
            
            imagePickerViewController.sourceType = .Camera
            self.presentViewController(imagePickerViewController, animated: true, completion: nil)
            
        }
        
        alertController.addAction(pickFromLibraryAction)
        alertController.addAction(takeAPictureAction)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let originalImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        self.photoImageView.image = originalImage
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }

    
    
    
    @IBAction func savePicture(button: AnyObject) {
        
        
        UIImageWriteToSavedPhotosAlbum(self.photoImageView.image!, nil, nil, nil)
        
        
    }
 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

