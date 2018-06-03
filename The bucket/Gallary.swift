//
//  Gallary.swift
//  The bucket
//
//  Created by 최용규 on 2018. 6. 1..
//  Copyright © 2018년 YG. All rights reserved.
//

import UIKit




class Gallary: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
   
    
    var MemoData = [String]()
    var Locationname = ["1","2","3"]
    var Memoimage = [UIImage(named: "1"),UIImage(named: "2"),UIImage(named: "3")]

    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       MemoData = UserDefaults.standard.object(forKey: "MemoData" ) as? [String] ?? [String]()
        return MemoData.count
        //return Locationname.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let CollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath ) as! MaincollectionCell
        
        
       MemoData = UserDefaults.standard.object(forKey: "MemoData" ) as? [String] ?? [String]()
        //CollectionCell .CollectionTitle.text = Locationname[indexPath.row]
        //CollectionCell .CollectionDescription.text = Locationname[indexPath.row]
        CollectionCell.CollectionTitle.text = MemoData[indexPath.row]
        CollectionCell.CollectionDescription.text = MemoData[indexPath.row]
        CollectionCell .CollectionImage.image? = Memoimage[indexPath.row]!
        return CollectionCell }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //셀을  선택했을때 관련 명령어
        let MemoNumber = indexPath.row
        //리스트 메모의 인덱스를 부여하는 과정
        
        UserDefaults.standard.set(MemoNumber, forKey: "MemoNumber")
        
        self.performSegue(withIdentifier: "ToRecord" , sender: self)
        //연결의 identifier가 ToRecord 로 명명된 것만 시행한다
    }
    
    
    @IBAction func Add(_ sender: Any) {
        
        UserDefaults.standard.set(-1, forKey: "MemoNumber")
        
    }
    
    
    //만들 뷰의 개수
   
    /*

    
    func collectionView(_ collectionView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //셀을  선택했을때 관련 명령어
        let MemoNumber = indexPath.row
        //리스트 메모의 인덱스를 부여하는 과정
        
        UserDefaults.standard.set(MemoNumber, forKey: "MemoNumber")
        
        self.performSegue(withIdentifier: "ToRecord" , sender: self)
        //연결의 identifier가 ToRecord 로 명명된 것만 시행한다
    }
    
    @IBAction func Add(_ sender: Any) {
        
        UserDefaults.standard.set(-1, forKey: "MemoNumber")
        
        
    }
    
    
*/
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
