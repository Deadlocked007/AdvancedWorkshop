//
//  ViewController.swift
//  AdvancedWorkshop
//
//  Created by Siraj Zaneer on 3/24/17.
//  Copyright © 2017 sirajzaneer.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    var movie: Movie!
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameLabel.text = movie.name
        priceLabel.text = movie.price
        summaryLabel.text = movie.summary
        summaryLabel.adjustsFontSizeToFitWidth = true
        posterView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

