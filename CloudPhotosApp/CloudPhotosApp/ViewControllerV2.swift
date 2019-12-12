//
//  ViewControllerV2.swift
//  CloudPhotosApp
//
//  Created by Mark Kriegsies on 12/11/19.
//  Copyright © 2019 Mark Kriegsies. All rights reserved.

// Source of assistance: "The Swift Guy" on Youtube: https://www.youtube.com/watch?v=v8r_wD_P3B8
// Code source for uploading to Firebase Storage: https://firebase.google.com/docs/storage/ios/create-reference , https://firebase.google.com/docs/storage/ios/upload-files , Firebase Youtube channel: https://www.youtube.com/watch?v=Bd4-6pnjjd8&t=23s

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
        let imageID = UUID.init().uuidString        //Unique ID given to image name so you can upload multiple images
        let uploadRef = Storage.storage().reference(withPath: "images/uploadedPicture\(imageID)")   //reference to location in Firebase
        
        //converts image to a data object
        guard let imageData = imageViewOutlet.image?.jpegData(compressionQuality: 0.75) else
            { return }
        
        let uploadMetadata = StorageMetadata.init()
        uploadMetadata.contentType = "image/jpeg" //adds metadata
        
        
        //actually uploads the file
        uploadRef.putData(imageData, metadata: uploadMetadata) { (downloadMetadata, error) in
            if let error = error {
                print("An error occurred. \(error.localizedDescription)")
                return
            }
            print("Put is complete and I got this back: \(String(describing: downloadMetadata))")
            
            
            
            self.imageViewOutlet.image = nil //clears image selected
            
        }
        
        
        
        
        /* Old Upload Code
        let storage = Storage.storage()
        
        //the section below declares our Cloud Storage references within Firebase
        let storageRef = storage.reference() //root reference
        let imagesFolderRef = storageRef.child("imagesFolder")     //child reference
        let imageRef = storageRef.child("images/image1.jpg")       //reference to the jpg image within the 'images' folder
        
        imagesFolderRef.name == imagesFolderRef.name   //asserts the filenames are associated with the correct files
        imageRef.name == imageRef.name
        
        
        //Uploading picture
        let data = Data()  //Data in memory
        
        //uploadTask uploads the picture to the path "images.image2.jpg"
        let uploadTask = imageRef.putData(data, metadata: nil) { (metadata, error) in
            guard let downoadlURL = metadata else {
                //error occured
                return
            }
            //metadata
           // let size = metadata.size
            
            //download URL
            imageRef.downloadURL { (url, error) in
                guard let downloadURL = url else {
                    //Error occured
                    return
                }
            
            }
           
       
    } */
        
    }
    
    

}
