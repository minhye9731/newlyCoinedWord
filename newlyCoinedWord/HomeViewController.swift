//
//  ViewController.swift
//  newlyCoinedWord
//
//  Created by 강민혜 on 7/8/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet var hashTags: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        hashTags[0].setTitle("사과", for: .normal)
//        hashTags[1].setTitle("바나나", for: .normal)
//        hashTags[2].setTitle("배", for: .normal)
//        hashTags[3].setTitle("포도", for: .normal)
        setUI()
    }
    
    func setUI() {
        
        searchTextField.keyboardType = .default
        searchTextField.backgroundColor = UIColor.white
        searchTextField.borderStyle = .line
        searchTextField.layer.borderColor = UIColor.black.cgColor
        
        // 해쉬테그 ui 설정
        for i in hashTags {
            i.backgroundColor = .white
            i.layer.borderWidth = 1
            i.layer.borderColor = UIColor.black.cgColor
            i.setTitleColor(.black, for: .normal)
        }
    }
    
    
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
    // textfield에 입력된 신조어 단어에 해당하는 의미를 fkapfdp vyrlgka
    // 올라와있는 키보드를 내려줌
    }
    
    // 키보드내 엔터가 눌릴 때에도
    // textfield에 입력된 신조어 단어에 해당하는 의미를 fkapfdp vyrlgka
    // 올라와있는 키보드를 내려줌
    
    // tapgesture 실행시 (키보드가 올라와있다면) 키보드를 내려준다
    
    


}

