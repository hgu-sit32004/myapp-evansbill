//
//  ViewController.swift
//  The bucket
//
//  Created by 최용규 on 2018. 4. 10..
//  Copyright © 2018년 YG. All rights reserved.
//

import UIKit

class Main : UIViewController,UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 20
        //만들 리스트의 개수
    }
    
    
    func  tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let Cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        //withIdentifier: "cell"이 동일하게 identifier부분에서 cell이 들어가야한다
        
        return Cell
    }
    //셀 수식 부분
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //셀을  선택했을때 관련 명령어
  
    }
}


