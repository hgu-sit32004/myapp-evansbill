//
//  ImagePick.swift
//  The bucket
//
//  Created by 최용규 on 2018. 6. 12..
//  Copyright © 2018년 YG. All rights reserved.
//

import UIKit

class ImagePick: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var imageview: UIImageView!
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
   
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imageview.image = image
        
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
            //출처: http://devsc.tistory.com/76 [You Know Programing?]
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
