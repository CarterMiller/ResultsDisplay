//
//  ViewController.swift
//  Test
//
//  Created by Russell Morgan on 01/02/2017.
//  Copyright © 2017 Carter Miller. All rights reserved.
//

import UIKit
import Foundation
import SystemConfiguration.CaptiveNetwork

class ViewController: UIViewController
{

    var users : [String] = []
    
    @IBOutlet weak var resultsDisplay1: ResultsDisplay!
    @IBOutlet weak var resultsDisplay2: ResultsDisplay!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        resultsDisplay1.displayResults()
        resultsDisplay2.displayResults()


    }

    @IBAction func cmdSetPlayer1(_ sender: Any)
    {
        resultsDisplay1.results = ["W", "W", "D", "D", "D", "L", "L", "W", "W", "D"]
        resultsDisplay1.displayResults()
    }

    @IBAction func cmdSetPlayer2(_ sender: Any)
    {
        resultsDisplay2.results = ["L", "L", "W", "D", "D", "L", "L", "W", "W", "W"]
        resultsDisplay2.displayResults()
    }
    
    
        
}

