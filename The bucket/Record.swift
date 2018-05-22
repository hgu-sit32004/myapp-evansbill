//
//  record.swift
//  The bucket
//
//  Created by 최용규 on 2018. 5. 15..
//  Copyright © 2018년 YG. All rights reserved.
//

import UIKit

class Record: UIViewController {

    //MARK: -variable
    @IBOutlet weak var RecordText: UITextView!
    
    var MemoData = [String]() //메모가 저장되는 집합을 만든다
    //variable-end
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let MemoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int
        
        if MemoNumber == -1{
            MemoData = UserDefaults.standard.object(forKey: "MemoData") as! [String]

             RecordText.text = " "
            
        }
        else {
        
        MemoData = UserDefaults.standard.object(forKey: "MemoData") as! [String]
            
            RecordText.text = MemoData[MemoNumber]
            
        }
        //값이 있다면 집합형태로 값을 불러오고 없다면 빈 값으로 불러온다
        
      
    }

    //MARK: - Action
    @IBAction func Save(_ sender: Any) {
       
        let  MemoNuber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int
        if MemoNuber == -1{
            
            MemoData.insert(RecordText.text, at: 0)
            UserDefaults.standard.set(MemoData , forKey: "MemoData")
        }
            
            
        else
        {
         MemoData.remove(at: MemoNuber)
            MemoData.insert(RecordText.text, at: MemoNuber)
            UserDefaults.standard.set(MemoData , forKey: "MemoData")
            
        }
        
        
        //가장 나중에 기록된 값이 맨 상단으로 오기 위하여 at 0로 한다
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
