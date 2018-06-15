
//
//  record.swift
//  The bucket
//
//  Created by 최용규 on 2018. 5. 15..
//  Copyright © 2018년 YG. All rights reserved.
//

import UIKit
import CoreData

class Record: UIViewController {
    
    var bucket = [Bucket]()
    
    //MARK: -variable
    @IBOutlet weak var RecordText: UITextView!

    @IBOutlet weak var RecordDescription: UITextView!
    
    var MemoData = [String]() //메모가 저장되는 집합을 만든다
    var MemoDescripData = [String]()
    var MemoTime = [String]()
    var managedObjextContext:NSManagedObjectContext!
    
    
    
    //variable-end
    
    
    let MemoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int
    let bucketItem = Bucket()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        managedObjextContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
       
        // Do any additional setup after loading the view, typically from a nib.
        
        // Do any additional setup after loading the view.
        
    
    
   
        
       let  MemoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int
     
    
        if MemoNumber == -1
        {
            RecordText.text = "Bucket Title"
        }
        else {
            
            MemoData = UserDefaults.standard.object(forKey: "MemoData") as! [String]
            
            //RecordText.text = bucketItem(MemoNumber]
            print(MemoNumber)
        }
        //값이 있다면 집합형태로 값을 불러오고 없다면 빈 값으로 불러온다
    }
        
    
    
    //MARK: - Action
    @IBAction func Save(_ sender: Any) {
         let bucketItem = Bucket(context: managedObjextContext)
        
        let date = NSDate() //현재 시간을 가져옴
        let formatter = DateFormatter() //DateFormatter라는 클래스의 상수 선언
        formatter.dateFormat = "yyyy-MM-dd" //상수 formatter의 dateFormat 속성 설정\
        
        let  MemoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int
      
        if RecordText.text == ""
        {
            
        }
        else
        {
            if MemoNumber == -1
            {
            
                MemoData.insert(RecordText.text, at: 0)
                MemoTime.insert(formatter.string(from: date as Date), at:0)
                MemoDescripData.insert(RecordDescription.text, at:0)
                bucketItem.memoTitle = RecordText.text
                bucketItem.memoDescription = RecordDescription.text
                bucketItem.memoDate = formatter.string(from: date as Date)
                //UserDefaults.standard.set(MemoData, forKey: "MemoData")
                //UserDefaults.standard.set(MemoTime, forKey: "MemoTime")
                //UserDefaults.standard.set(MemoDescripData, forKey: "MemoDescription")
            }
                
                
            else
            {
                MemoData.remove(at: MemoNumber)
                MemoDescripData.remove(at: MemoNumber)
                MemoData.insert(RecordText.text, at: MemoNumber)
                MemoDescripData.insert(RecordDescription.text,at:MemoNumber)
                //UserDefaults.standard.set(MemoData , forKey: "MemoData")
                //UserDefaults.standard.set(MemoDescripData , forKey: "MemoDescription")
            }
            
            //가장 나중에 기록된 값이 맨 상단으로 오기 위하여 at 0로 한다
        }
        
    }
    
    
    @IBAction func Success(_ sender: Any) {
        //버튼을 누르면, 저장되어 있는 값을 다른 레이어로 옮긴다.
        
        
    }
    
    @IBAction func Delete(_ sender: Any) {
        
        
        
        
        let  MemoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int
        
        if MemoNumber != -1{
            
            MemoData.remove(at: MemoNumber)
            UserDefaults.standard.set(MemoData , forKey: "MemoData")
        }
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


    /*
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
   
        let MemoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int
        
        if MemoNumber == -1
        {
            
            RecordText.text =  ""

            
        }
        else {
        
        MemoData = UserDefaults.standard.object(forKey: "MemoData") as! [String]
        RecordText.text = MemoData[MemoNumber]
            //MemoDescripData = UserDefaults.standard.object(forkey: "MemoData") as! [String]
            
          //MemoDescripData.text = MemoDescripData[MemoNumber]
        }
        //값이 있다면 집합형태로 값을 불러오고 없다면 빈 값으로 불러온다
        
      
    }

    //MARK: - Action
    @IBAction func Save(_ sender: Any) {
        let date = NSDate() //현재 시간을 가져옴
        let formatter = DateFormatter() //DateFormatter라는 클래스의 상수 선언
        formatter.dateFormat = "yyyy-MM-dd" //상수 formatter의 dateFormat 속성 설정\
       
        //formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE" //상수 formatter의 dateFormat 속성 설정\
       
        let  MemoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int
        print("MemoNumber")
        print(MemoNumber)
        
        if RecordText.text == ""
        {
        }
        else
            {
            if MemoNumber == -1
            
                
            {
                print("새로운 메모를 작성하겠습니다")
                MemoData.insert(RecordText.text, at: 0)
                MemoDescripData.insert(RecordDescription.text,at:0)
                MemoTime.insert(formatter.string(from: date as Date), at:0)
                UserDefaults.standard.set(MemoData, forKey: "MemoData")
                UserDefaults.standard.set(MemoDescripData, forKey: "MemoDescription")
                UserDefaults.standard.set(MemoTime, forKey: "MemoTime")
                // 현재 날짜를 설정한 포맷대로 lblCurrentTime.text 입력
            }
                
                
            else
            {
                MemoData.remove(at: MemoNumber)
                MemoDescripData.remove(at: MemoNumber)
                MemoData.insert(RecordText.text, at: MemoNumber)
                MemoDescripData.insert(RecordDescription.text,at:MemoNumber)
                UserDefaults.standard.set(MemoData , forKey: "MemoData")
                UserDefaults.standard.set(MemoDescripData , forKey: "MemoDescription")
            }
        
        
        //가장 나중에 기록된 값이 맨 상단으로 오기 위하여 at 0로 한다
    }
        
    }
    
    
    @IBAction func Success(_ sender: Any) {
        //버튼을 누르면, 저장되어 있는 값을 다른 레이어로 옮긴다.
        
        
    }
    
    @IBAction func Delete(_ sender: Any) {
        
        let  MemoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int
        
        if MemoNumber != -1
        {
          MemoData.remove(at: MemoNumber)
          UserDefaults.standard.set(MemoData , forKey: "MemoData")
        }
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
*/
