//
//  ViewController.swift
//  newlyCoinedWord
//
//  Created by 강민혜 on 7/8/22.
//

import UIKit


enum NewCoinedWord: String, CustomStringConvertible, CaseIterable {
    case 윰차
    case 알잘딱깔쎈
    case 내또출
    case H워얼V
    case 많관부
    case 회의주의자
    case 글설리
    case Whyrano
    case 너뭐돼
    case 당모치
    case 돼지런하다
    case 무물
    
    var description: String {
        switch self {
        case .윰차: return "유명인과 무명인을 차별한다는 뜻"
        case .알잘딱깔쎈: return "알아서 잘! 깔끔하고 센스있게~!"
        case .내또출: return "내일 또 출근한다"
        case .H워얼V: return "사랑한다는 뜻. 사랑해의 형태를 뒤집어서 표현한 것"
        case .많관부: return "'많은 관심 부탁드립니다'의 줄임말"
        case .회의주의자: return "뻑하면 회의하자고 하는 직장인"
        case .글설리: return "글쓴이를 설레게 하는 리플"
        case .Whyrano: return "왜이러냐의 사투리 표현인 와이라노를 영어로 적은 말"
        case .너뭐돼: return "'너가 혹시 뭐라도 돼? 라는 뜻으로 유튜버 레오제이님으로 유명해진 유행어"
        case .당모치: return "당연히 모든 치킨은 옳다"
        case .돼지런하다: return "평소에는 행동이 느린데 먹을 때만 엄청 부지런하다"
        case .무물: return "무엇이든 물어보세요"
        }
    }
}

class HomeViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet var hashTags: [UIButton]!
    @IBOutlet weak var resultLabel: UILabel!
    
    var word1: NewCoinedWord = .윰차
    var word2: NewCoinedWord = .알잘딱깔쎈
    var word3: NewCoinedWord = .내또출
    var word4: NewCoinedWord = .H워얼V
    var word5: NewCoinedWord = .많관부
    var word6: NewCoinedWord = .회의주의자
    var word7: NewCoinedWord = .글설리
    var word8: NewCoinedWord = .Whyrano
    var word9: NewCoinedWord = .너뭐돼
    var word10: NewCoinedWord = .당모치
    var word11: NewCoinedWord = .돼지런하다
    var word12: NewCoinedWord = .무물
    
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
    
    // MARK: - 검색버튼 클릭시 (touch up inside)
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        searchAndHashtag()
        view.endEditing(true)
    }
    
    // MARK: - 키보드 엔터키 클릭시 (did end on exit)
    @IBAction func keyboardEnterTapped(_ sender: UITextField) {
        searchAndHashtag()
    }
    
    // MARK: - 검색 및 해시테그예제 랜덤표기
    func searchAndHashtag() {
        searchLogic()
        changeNewCoinedWordRandom()
    }
    
    // MARK: - 신조어 검색 로직 및 키보드 내리기
    func searchLogic() {
        
        let text = searchTextField.text
        
        switch text {
        case word1.rawValue:
            resultLabel.text = word1.description
        case word2.rawValue:
            resultLabel.text = word2.description
        case word3.rawValue:
            resultLabel.text = word3.description
        case word4.rawValue:
            resultLabel.text = word4.description
        case word5.rawValue:
            resultLabel.text = word5.description
        case word6.rawValue:
            resultLabel.text = word6.description
        case word7.rawValue:
            resultLabel.text = word7.description
        case word8.rawValue:
            resultLabel.text = word8.description
        case word9.rawValue:
            resultLabel.text = word9.description
        case word10.rawValue:
            resultLabel.text = word10.description
        case word11.rawValue:
            resultLabel.text = word11.description
        case word12.rawValue:
            resultLabel.text = word12.description
        default:
            resultLabel.text = "검색 결과가 없습니다. 다른 신조어를 검색해주세요."
        }
        
    }
    
    // MARK: - 신조어 예제 해쉬테그 랜덤표기
    func changeNewCoinedWordRandom() {
        // 신조어 키값 4개를 랜덤으로 추출하기
        var randomKeys: [String] = []
        
        while randomKeys.count < 4 {
            let randomkey = NewCoinedWord.allCases.randomElement()!
            let data = randomkey.rawValue
            
            if !randomKeys.contains(data) {
                randomKeys.append(data)
             }
        }
    
        // 버튼 hashTags.count개에 반복하여 적용
        for i in 0...(hashTags.count - 1) {
            hashTags[i].setTitle(randomKeys[i], for: .normal)
            hashTags[i].setTitleColor(.black, for: .normal)
            hashTags[i].backgroundColor = .white
            hashTags[i].layer.cornerRadius = 8
            hashTags[i].clipsToBounds = true
            hashTags[i].layer.borderWidth = 1
            hashTags[i].layer.borderColor = UIColor.black.cgColor
        }
    }
        
    // MARK: - view 탭시 (키보드가 올라와있다면) 키보드를 내려줌
    @IBAction func tapGestureClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

