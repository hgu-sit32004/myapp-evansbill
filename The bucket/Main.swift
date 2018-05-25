//
//  ViewController.swift
//  The bucket
//
//  Created by 최용규 on 2018. 4. 10..
//  Copyright © 2018년 YG. All rights reserved.
//

import UIKit

class Main : UIViewController,UITableViewDelegate, UITableViewDataSource {

    
    var MemoData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       MemoData = UserDefaults.standard.object(forKey: "MemoData" ) as? [String] ?? [String]()
        return MemoData.count
        //만들 리스트의 개수
    }
    
    
    func  tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let Cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MainCell
        //maincell 을 연결하기
        
        Cell.TitleCell.text = "1"
        
       
        
        //withIdentifier: "cell"이 동일하게 identifier부분에서 cell이 들어가야한다
        
        return Cell
    }
    //셀 수식 부분
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //셀을  선택했을때 관련 명령어
        let MemoNumber = indexPath.row
        //리스트 메모의 인덱스를 부여하는 과정
        
        UserDefaults.standard.set(MemoNumber, forKey: "MemoNumber")
        
        self.performSegue(withIdentifier: "ToRecord" , sender: self)
        //연결의 identifier가 ToRecord 로 명명된 것만 시행한다
    }

    @IBAction func Add(_ sender: Any) {
    
        UserDefaults.standard.set(-1, forKey: "MemoNuber")
    
    }
    
}


