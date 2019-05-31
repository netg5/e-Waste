//
//  ReportWasteViewController.swift
//  e-VMSS
//
//  Created by Harsh Mehta on 29/03/19.
//  Copyright © 2019 Harsh Mehta. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import Firebase

class ReportWasteViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var takePhoto: UIButton!
    let imagePicker = UIImagePickerController()
    var ref: DatabaseReference!
    let date = Date()
    let calendar = Calendar.current
    var year: Int = 0
    var week: Int = 0
    var hour: Int = 0
    var minutes: Int = 0
    var seconds: Int = 0
    

    @IBOutlet weak var wastePhoto: UIImageView!
    @IBOutlet var reportStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        reportStatus.text = ""
        takePhoto.layer.shadowOpacity = 0.15
        takePhoto.layer.shadowRadius = 1
        takePhoto.layer.shadowColor = UIColor.black.cgColor
        takePhoto.layer.cornerRadius = 1
    }
    
    @IBAction func reportPhoto(_ sender: Any) {
        year = calendar.component(.year, from: date)
        week = calendar.component(.weekOfYear, from: date)
        hour = calendar.component(.hour, from: date)
        minutes = calendar.component(.minute, from: date)
        seconds = calendar.component(.second, from: date)
        
        let user = Auth.auth().currentUser
        let uid = user!.uid
        ref = Database.database().reference().child("Photos")
        let reference = ref.child(String(year) + String(week) + String(hour) + String(minutes) + String(seconds)).child(uid)
        
        reference.child("Location").setValue("Coordinates")
        reference.child("Photo").setValue("Image")
    }
    @IBAction func takePhoto(_sender: Any){
        imagePicker.delegate = self
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            reportStatus.text = "Photo can't be taken"
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let wasteImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        wastePhoto.image = wasteImage
        imagePicker.dismiss(animated: true, completion: nil)
        reportStatus.text = "✅ Photo Submitted!"
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
