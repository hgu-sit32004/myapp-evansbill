//
//  ImagePick.swift
//  The bucket
//
//  Created by 최용규 on 2018. 6. 12..
//  Copyright © 2018년 YG. All rights reserved.
//

import UIKit
import CoreData


var managedObjextContext:NSManagedObjectContext!

var bucket = [Bucket]()
let bucketItem = Bucket(context: managedObjextContext)
class ImagePick: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    let MemoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int
    var ImageData = [UIImage]()
    
    let defaultimage = [UIImage(named: "1")]
    
    @IBAction func imageSave(_ sender: Any) {
        
        
/*
        
        let  MemoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int
  
        
       
            if MemoNumber == -1
                
            {
                
                ImageData.insert(imageview.image!, at: 0)
                 UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: ImageData), forKey: "ImageData")
            }
                
                
            else
            {
               // ImageData.remove(at: MemoNumber)
                //ImageData.insert(imageview.image!, at: MemoNumber)
                UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: ImageData), forKey: "ImageData")
            }
            
        */
                
                //가장 나중에 기록된 값이 맨 상단으로 오기 위하여 at 0로 한다
        
            
        
    }
    @IBOutlet weak var imageview: UIImageView!
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    //사진 불러오는 과정
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        managedObjextContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageview.image = image
        bucketItem.memoImage = NSData(data: UIImageJPEGRepresentation(image!, 0.3)!) as Data
        //UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: ImageData), forKey: "ImageNumber")
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func chooseimage(_ sender: Any) {
        
        let controller = UIImagePickerController()
        controller.delegate = self
        controller.sourceType = .photoLibrary
        present(controller, animated: true ,completion:  nil)
        
        
       /*
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle:  .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action:UIAlertAction) in }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Libraray", style: .default, handler: {(action:UIAlertAction) in }))
        
       // actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:nil ))*/
      
        /*
        self.present(actionSheet , animated:  true , completion:  nil)
        if UIDevice.current.userInterfaceIdiom == .pad { //디바이스 타입이 iPad일때
            if let popoverController = actionSheet.popoverPresentationController { // ActionSheet가 표현되는 위치를 저장해줍니다.
                popoverController.sourceView = self.view
                popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
                popoverController.permittedArrowDirections = []
                self.present(actionSheet, animated: true, completion: nil) } }
        else { self.present(actionSheet, animated: true, completion: nil) }
            */
            
        /*
        if UIDevice.current.userInterfaceIdiom == .pad { //디바이스 타입이 iPad일때
            if let popoverController = actionSheet.popoverPresentationController { // ActionSheet가 표현되는 위치를 저장해줍니다.
                popoverController.barButtonItem = sender as? UIBarButtonItem
                self.present(actionSheet, animated: true, completion: nil) } }
        else { self.present(actionSheet, animated: true, completion: nil) }
            
           // 출처: http://devsc.tistory.com/76 [You Know Programing?]*/
 
        //아이패드는 위치지정 해줘야함
        
   
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let MemoNumber = UserDefaults.standard.object(forKey: "MemoNumber") as! Int
        
        if MemoNumber == -1
        {
             imageview.image = defaultimage[0]
            
        }
        else {
            
            ImageData = UserDefaults.standard.object(forKey: "ImageData") as?  [UIImage] ?? [UIImage]()
           
            //imageview.image = ImageData[MemoNumber]
            
        }
        //값이 있다면 집합형태로 값을 불러오고 없다면 빈 값으로 불러온다
        
        
    }
        // Do any additional setup after loading the view.
    

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
