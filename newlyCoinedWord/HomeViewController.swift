//
//  ViewController.swift
//  newlyCoinedWord
//
//  Created by 강민혜 on 7/8/22.
//

import UIKit

class HomeViewController: UIViewController, UITextFieldDelegate {
    
    var newCoinedWord: [String : String] = [
        "윰차" : "유명인과 무명인을 차별한다는 뜻",
        "알잘딱깔쎈" : "알아서 잘! 깔끔하고 센스있게~!",
        "내또출" : "내일 또 출근한다",
        "H워얼V" : "사랑한다는 뜻. 사랑해의 형태를 뒤집어서 표현한 것",
        "많관부" : "'많은 관심 부탁드립니다'의 줄임말",
        "회의주의자" : "뻑하면 회의하자고 하는 직장인",
        "글설리" : "글쓴이를 설레게 하는 리플",
        "Whyrano" : "왜이러냐의 사투리 표현인 와이라노를 영어로 적은 말",
        "너 뭐 돼?" : "'너가 혹시 뭐라도 돼? 라는 뜻으로 유튜버 레오제이님으로 유명해진 유행어",
        "당모치" : "당연히 모든 치킨은 옳다",
        "돼지런하다" : "평소에는 행동이 느린데 먹을 때만 엄청 부지런하다",
        "무물" : "무엇이든 물어보세요"
    ]

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet var hashTags: [UIButton]!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeNewCoinedWordRandom()
        setUI()
        searchTextField.delegate = self
    }
    
    func setUI() {
        // 검색 텍스트 필드 설정
        searchTextField.keyboardType = .default
        searchTextField.backgroundColor = UIColor.white
        searchTextField.borderStyle = .line
        searchTextField.layer.borderColor = UIColor.black.cgColor
        searchTextField.attributedPlaceholder = NSAttributedString(string: "신조어를 입력해주세요!", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        searchTextField.autocorrectionType = .no
        // 텍스트필드 내부에 좌측 여백주기
        searchTextField.leftPadding()
        
        // hashTags ui 설정
        for i in hashTags {
            i.backgroundColor = .white
            i.layer.borderWidth = 1
            i.layer.borderColor = UIColor.black.cgColor
            i.setTitleColor(.black, for: .normal)
        }
        
        // 결과라벨
        resultLabel.textColor = .black
        resultLabel.font = UIFont.systemFont(ofSize: 18)
        resultLabel.text = "신조어의 의미를 알아봅시다!"
    }
    
    // MARK: - 신조어 예제 해쉬테그 랜덤표기
    func changeNewCoinedWordRandom() {
        // 신조어 키값 4개를 랜덤으로 추출하기
        var randomKeys: [String] = []
        
        while randomKeys.count < 4 {
            let randomkey = newCoinedWord.keys.randomElement()!
            
             if !randomKeys.contains(randomkey) {
                 randomKeys.append(randomkey)
             }
             print(randomKeys.sorted())
        }
    
        // 버튼 4개에 반복하여 적용
        for i in 0...3 {
            hashTags[i].setTitle("\(randomKeys[i])", for: .normal)
            hashTags[i].setTitleColor(.black, for: .normal)
            hashTags[i].backgroundColor = .white
            hashTags[i].layer.cornerRadius = 8
            hashTags[i].clipsToBounds = true
            hashTags[i].layer.borderWidth = 1
            hashTags[i].layer.borderColor = UIColor.black.cgColor
        }
    }
    
    // MARK: - 검색버튼 클릭시
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        searchLogic()
        changeNewCoinedWordRandom()
    }
    
    // MARK: - 키보드 엔터키 클릭시
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchLogic()
        changeNewCoinedWordRandom()
        return true
    }
    
    // MARK: - 신조어 검색 로직 및 키보드 내리기
    func searchLogic() {
        if searchTextField.text == "" {
            self.presentAlert(title: "신조어를 입력해주세요.")
            return
        } else if !newCoinedWord.keys.contains(searchTextField.text!) {
            self.presentAlert(title: "찾으시는 신조어가 사전에 없습니다. 다른 신조어를 검색해주세요.")
            return
        }
        resultLabel.text = newCoinedWord[searchTextField.text!]
        view.endEditing(true)
    }

    // MARK: - view 탭시 (키보드가 올라와있다면) 키보드를 내려줌
    @IBAction func tapGestureClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

