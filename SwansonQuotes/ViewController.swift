//
//  ViewController.swift
//  SwansonQuotes
//
//  Created by L.J. Yockey on 9/10/17.
//  Copyright © 2017 Yockey Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var qContainer: UILabel!
    
    @IBAction func getQuote(_ sender: Any) {
        
        let targetUrl = URL(string: "http://ron-swanson-quotes.herokuapp.com/v2/quotes")
        let task = URLSession.shared.dataTask(with: targetUrl!) { (data, response, error) in
            if error != nil {
                print("ERROR!")
            }
            else {
                if let content = data {
                    do {
                        let q = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
                        let quote = (q[0] as! String)
                        self.qContainer.text = quote
                    }
                    catch {
                        print("ERROR.")
                    }
                }
            }
        }
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

