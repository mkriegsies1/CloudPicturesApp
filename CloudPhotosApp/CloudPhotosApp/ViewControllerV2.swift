//
//  ViewControllerV2.swift
//  CloudPhotosApp
//
//  Created by Mark Kriegsies on 12/11/19.
//  Copyright © 2019 Mark Kriegsies. All rights reserved.

// Source of assistance: "The Swift Guy" on Youtube: https://www.youtube.com/watch?v=v8r_wD_P3B8
//

import UIKit
import Firebase
import FirebaseStorage


class ViewControllerV2: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate   {

    @IBOutlet weak var imageViewOutlet: UIImageView! //MARK: - imageViewOutlet
    
    @IBAction func selectImageAction(_ sender: Any) //MARK: - selectImageAction
    {
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        image.allowsEditing = false
        
        self.present(image, animated: true) {
        }
    }
    
    /* Picking an Image */
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        if let image = info[.originalImage] as? UIImage
       {
        imageViewOutlet.image = image
        }
        else { //Error
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
        
       }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
     
    @IBAction func cloudUploadAction(_ sender: Any) {
        let storage = Storage.storage()     //Code source: https://firebase.google.com/docs/storage/ios/create-reference
                                            //Code source: https://firebase.google.com/docs/storage/ios/upload-files
        
        //the section below declares our Cloud Storage references within Firebase
        let storageRef = storage.reference() //root reference
        let imagesFolderRef = storageRef.child("imagesFolder") //child reference
        let imageRef = storageRef.child("images/image1.jpg")       //reference to the jpg image within the 'images' folder
        
        imagesFolderRef.name == imagesFolderRef.name
        imageRef.name == imageRef.name
        
        
        
        
        
        
        
    }
    
    

}
