//
//  Gallary.swift
//  The bucket
//
//  Created by 최용규 on 2018. 6. 1..
//  Copyright © 2018년 YG. All rights reserved.
//

import UIKit
import CoreData



class Gallary: UIViewController,UIImagePickerControllerDelegate,UICollectionViewDataSource, UICollectionViewDelegate {
   
    var bucket = [Bucket]()
   var managedObjextContext:NSManagedObjectContext!
    
    
    var MemoTime = [String]()
    var MemoData = [String]()
    var MemoDescripData = [String]()
    var ImageData = [UIImage]()
    var defauldimage = [UIImage(named: "1")]
    
    override func viewDidLoad() {
      
        //스와이프 해서 넘어가는 부분
        super.viewDidLoad()
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(swipe:)))
        leftSwipe.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(leftSwipe)
       
        
        managedObjextContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        
        
        loadData()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    
        navigationController?.navigationBar.tintColor = UIColor.black
    }
    
    func loadData(){
        let presentRequest:NSFetchRequest<Bucket> = Bucket.fetchRequest()
        
        do {
            
            bucket = try managedObjextContext.fetch(presentRequest)
     
        }catch {
            print("Could not load data from database \(error.localizedDescription)")
        }
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        MemoData = UserDefaults.standard.object(forKey: "MemoData" ) as? [String] ?? [String]()
        MemoTime = UserDefaults.standard.object(forKey: "MemoTime") as? [String] ?? [String]()
        MemoDescripData = UserDefaults.standard.object(forKey: "MemoDescription" ) as? [String] ?? [String]()
        return bucket.count
        
        /*
        MemoData = UserDefaults.standard.object(forKey: "MemoData" ) as? [String] ?? [String]()
        MemoDescripData = UserDefaults.standard.object(forKey: "MemoDescription" ) as? [String] ?? [String]()
        MemoTime = UserDefaults.standard.object(forKey: "MemoTime") as? [String] ?? [String]()
        
        print(MemoData.count)
        return MemoTime.count*/
        //return Locationname.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let CollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath ) as! MaincollectionCell
        
       MemoData = UserDefaults.standard.object(forKey: "MemoData" ) as? [String] ?? [String]()
       MemoTime = UserDefaults.standard.object(forKey: "MemoTime") as? [String] ?? [String]()
       MemoDescripData = UserDefaults.standard.object(forKey: "MemoDescription" ) as? [String] ?? [String]()
       
       let bucketItem = bucket[indexPath.row]
        
        if let memoimage = UIImage(named: "1"){

        }
        CollectionCell.CollectionTitle.text = bucketItem.memoTitle
        CollectionCell.CollectionDescription.text = bucketItem.memoDescription
        CollectionCell.CollectionDate.text = bucketItem.memoDate
        if bucketItem.memoImage == nil{
            CollectionCell.AchieveImage.image = UIImage()
        }
        else{
            CollectionCell.AchieveImage.image = UIImage(data: (bucketItem.memoImage!))
        }
        //CollectionCell.CollectionDate.text = MemoTime[indexPath.row]
        //CollectionCell.CollectionDescription.text = MemoDescripData[indexPath.row]
        //CollectionCell.CollectionImage.image? = defauldimage[0]!
        return CollectionCell
        /*
        CollectionCell.CollectionTitle.text = MemoData[indexPath.row]
        CollectionCell.CollectionDate.text = MemoTime[indexPath.row]
        CollectionCell.CollectionDescription.text = MemoDescripData[indexPath.row]
        CollectionCell.CollectionImage.image? = defauldimage[0]!
 
       // CollectionCell .CollectionImage.image? = ImageData[indexPath.row]
      
        return CollectionCell
  */
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //셀을  선택했을때 관련 명령어
        
        
      
      
        
        
        
        let MemoNumber = indexPath.row
        //리스트 메모의 인덱스를 부여하는 과정
        
        UserDefaults.standard.set(MemoNumber, forKey: "MemoNumber")
        
        print(indexPath.row)
        //self.performSegue(withIdentifier: "ToRecord" , sender: self)
        //연결의 identifier가 ToRecord 로 명명된 것만 시행한다
    }
    
   
    
    @IBAction func Add(_ sender: Any) {
        
        UserDefaults.standard.set(-1, forKey: "MemoNumber")
        
    }
    
    
    //만들 뷰의 개수
   
   
    

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
