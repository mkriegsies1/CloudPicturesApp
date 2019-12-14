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
import UserNotifications


class ViewControllerV2: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate   {

    //MARK: - Image View
    @IBOutlet weak var imageViewOutlet: UIImageView! //MARK: - imageViewOutlet
    
    
    //MARK: - Image Selection
    @IBAction func selectImageAction(_ sender: Any) //MARK: - selectImageAction
    {
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        
        image.allowsEditing = false
        
        self.present(image, animated: true) {
        }
    }
    
    //MARK: - Image Selection
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
            //MARK: - Upload Notification
                                        
                    /* Notifications are in progress
        
        
                //Source: https://www.youtube.com/watch?v=JuqQUP0pnZY
        
        //Asks for notification permission
        let nCenter = UNUserNotificationCenter.current()
        nCenter.requestAuthorization(options: [.alert, .sound]) { (accessGranted, error) in
        }
        
        //Notification Content
        let nContent = UNMutableNotificationContent()
        nContent.title = "Upload Status:"
        nContent.body = "Upload Complete!"
        
        //Trigger
        let trigger = self.imageViewOutlet.image = nil
        
        //request trigger
        let uuidString = UUID().uuidString
        UNNotificationRequest(identifier: uuidString, content: nContent, trigger: trigger)
        
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
     
    
    
            //MARK: - Upload Button
    @IBAction func cloudUploadAction(_ sender: Any) {
        let imageID = UUID.init().uuidString        //Unique ID given to image name so you can upload multiple images
        let uploadRef = Storage.storage().reference(withPath: "images/uploadedPicture\(imageID)")   //reference to location in Firebase
        
        //converts image to a data object
        guard let imageData = imageViewOutlet.image?.jpegData(compressionQuality: 0.75) else
            { return }
        
        let uploadMetadata = StorageMetadata.init()
        uploadMetadata.contentType = "image/jpeg" //adds metadata
        
        
        //MARK: - Uploading the Image
        uploadRef.putData(imageData, metadata: uploadMetadata) { (downloadMetadata, error) in
            if let error = error {
                print("An error occurred. \(error.localizedDescription)")
                return
            }
            print("Put is complete and I got this back: \(String(describing: downloadMetadata))")
            
            
            
            self.imageViewOutlet.image = nil //clears image selected
            
        }
        
        
        
        
        
    }
    
    

}
