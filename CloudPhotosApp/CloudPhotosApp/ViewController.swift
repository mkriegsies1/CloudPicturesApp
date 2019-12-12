//
//  ViewController.swift
//  CloudPhotosApp
//
//  Created by Mark Kriegsies on 12/10/19.
//  Copyright © 2019 Mark Kriegsies. All rights reserved.
//
// Sources: "Davids Videos" on YouTube https://www.youtube.com/watch?v=wDzk5KDe6Uw
//

import UIKit



class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //Outlets and Actions
    @IBOutlet var imageView: UIImageView!
    
    
    @IBAction func chooseImageButton(_ sender: Any)
    {
  
    let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = .photoLibrary
        //image.sourceType = .camera
        image.allowsEditing = false
    }
    
    @IBAction func uploadToCloudButton(_ sender: Any) {
    }
    
    
    //Picking an Image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        if let image = info[.originalImage] as? UIImage
        {
            imageView.image = image
            
        }
        else
        {
            //Error message
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.myImageView.contentMode = .scaleToFill
    }


}

