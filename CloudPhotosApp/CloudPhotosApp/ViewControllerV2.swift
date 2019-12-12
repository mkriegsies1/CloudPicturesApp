//
//  ViewControllerV2.swift
//  CloudPhotosApp
//
//  Created by Mark Kriegsies on 12/11/19.
//  Copyright © 2019 Mark Kriegsies. All rights reserved.

// Source of assistance: "The Swift Guy" on Youtube: https://www.youtube.com/watch?v=v8r_wD_P3B8
//

import UIKit

class ViewControllerV2: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    

    @IBOutlet weak var imageViewOutlet: UIImageView!
    
    @IBAction func selectImageAction(_ sender: Any)
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
     
     
    

}
