//
//  record.swift
//  The bucket
//
//  Created by 최용규 on 2018. 5. 15..
//  Copyright © 2018년 YG. All rights reserved.
//

import UIKit

class Record: UIViewController {

    @IBOutlet weak var RecordText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
 RecordText.text = UserDefaults.standard.object(forKey: "0") as? String
    }

    @IBAction func Save(_ sender: Any) {
        UserDefaults.standard.set(RecordText.text, forKey: "0")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
