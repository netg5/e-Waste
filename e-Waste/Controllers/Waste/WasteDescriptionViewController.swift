//
//  WasteDescriptionViewController.swift
//  e-VMSS
//
//  Created by Harsh Mehta on 20/05/19.
//  Copyright © 2019 Harsh Mehta. All rights reserved.
//

import UIKit

class WasteDescriptionViewController: UIViewController {

    @IBOutlet var wasteImage: UIImageView!
    @IBOutlet var wasteName: UILabel!
    @IBOutlet var wasteType: UILabel!
    @IBOutlet var wasteDescription: UILabel!
    let wasteInfo = WasteDescriptionTableViewCell()
    override func viewDidLoad() {
        super.viewDidLoad()
        print(wasteInfo.wasteName.text as Any)
        wasteName.text = wasteInfo.wasteName.text
    }

}
