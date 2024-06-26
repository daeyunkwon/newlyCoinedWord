//
//  ViewController.swift
//  newlyCoinedWord
//
//  Created by 권대윤 on 5/18/24.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet var backView: UIView!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    
    @IBOutlet var firstAutoInputButton: UIButton!
    @IBOutlet var secondAutoInputButton: UIButton!
    @IBOutlet var thirdAutoInputButton: UIButton!
    @IBOutlet var fourthAutoInputButton: UIButton!
    
    @IBOutlet var backImageView: UIImageView!
    @IBOutlet var searchResultLabel: UILabel!
    
    var newlyCoinedWordList: [String: String] = [
        "윰차": "유명인과 무명인을 차별한다!",
        "실매": "실시간 매니저",
        "만반잘부": "만나서 반가워 잘 부탁해!",
        "꾸안꾸": "꾸민 듯 안 꾸민 듯!",
        "삼귀자": "연애를 시작하기 전 썸 단계!",
        "분깨미": "분위기 깨서 미안한데!",
        "기나죄": "기분 나빴다면 죄송합니다!",
        "스불재": "스스로 불러온 재앙!",
        "잼얘": "재밌는 이야기!",
        "드르륵 칵": "편의점 야외에 설치된 플라스틱 의자를 지칭하는 단어!",
        "보배": "보조 배터리!",
        "머선 129": "무슨 일이야!",
        "홀리몰리": "'어머나, 우와'와 같은 감탄사!",
        "갑통알": "갑자기 통장을 보니 아르바이트 해야겠다!",
        "조용한 사직": "직장을 그만두는 것은 아니나 정해진 시간과 업무만을 최소한으로 수행하며 초과근무를 거부하겠다!"
    ]
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchKeyword()
    }
    
    //MARK: - Configurations
    
    func configureUI() {
        setupUIView()
        setupUITextField()
        setupUIButton()
        setupUIImageView()
        setupUILabel()
    }
    
    func setupUIView() {
        backView.backgroundColor = .white
        backView.layer.borderColor = UIColor.black.cgColor
        backView.layer.borderWidth = 2
    }
    
    func setupUITextField() {
        searchTextField.borderStyle = .none
        searchTextField.tintColor = .black
        searchTextField.text = "삼귀자"
        searchTextField.returnKeyType = .search
    }
    
    func setupUIButton() {
        searchButton.backgroundColor = .black
        searchButton.tintColor = .white
        searchButton.setTitle("", for: .normal)
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .unspecified, scale: .default)
        let symbolImage = UIImage(systemName: "magnifyingglass", withConfiguration: symbolConfig)
        searchButton.setImage(symbolImage, for: .normal)
        
        configureAutoInputButton(button: firstAutoInputButton, titleText: "윰차")
        configureAutoInputButton(button: secondAutoInputButton, titleText: "실매")
        configureAutoInputButton(button: thirdAutoInputButton, titleText: "만반잘부")
        configureAutoInputButton(button: fourthAutoInputButton, titleText: "꾸안꾸")
    }
    
    func configureAutoInputButton(button: UIButton, titleText: String) {
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.tintColor = .black
        button.layer.cornerRadius = 12
        button.setTitle(titleText, for: .normal)
    }
    
    func setupUIImageView() {
        backImageView.image = UIImage.background
        backImageView.contentMode = .scaleAspectFill
    }
    
    func setupUILabel() {
        searchResultLabel.text = "연애를 시작하기 전 썸 단계!"
        searchResultLabel.textAlignment = .center
        searchResultLabel.numberOfLines = 0
    }
    
    //MARK: - Functions
    
    func fetchKeyword() {
        guard let keyword = UserDefaults.standard.string(forKey: "keyword") else {
            print("UserDefaults에서 저장된 키워드 데이터 불러오기 실패")
            return
        }
        
        guard let searchResult = UserDefaults.standard.string(forKey: "searchResult") else {
            print("UserDefaults에서 저장된 검색 결과 문구 데이터 불러오기 실패")
            return
        }
        
        searchTextField.text = keyword
        searchResultLabel.text = searchResult
    }
    
    func saveKeyword(keywordValue: String) {
        UserDefaults.standard.setValue(keywordValue, forKey: "keyword")
    }
    
    func saveSearchResult(resultValue: String) {
        UserDefaults.standard.setValue(resultValue, forKey: "searchResult")
    }
    
    
    @IBAction func keyboardDismiss(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func searchTextFieldReturnTapped(_ sender: UITextField) {
        excuteSearch()
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        excuteSearch()
    }
    
    func excuteSearch() {
        guard let searchText = searchTextField.text else {return}
        showNewlyCoinedWordMeaning(newlyCoinedWord: searchText)
        
        saveKeyword(keywordValue: searchText)
    }
    
    func showNewlyCoinedWordMeaning(newlyCoinedWord: String) {
        guard let meaning = newlyCoinedWordList[newlyCoinedWord] else {
            searchResultLabel.text = "검색결과가 없습니다."
            saveSearchResult(resultValue: searchResultLabel.text ?? "")
            return
        }
        
        searchResultLabel.text = meaning
        saveSearchResult(resultValue: searchResultLabel.text ?? "")
    }
    
    @IBAction func autoInputButtonTapped(_ sender: UIButton) {
        guard let newlyCoinedWord = sender.currentTitle else {return}
        
        searchTextField.text = newlyCoinedWord
        
        excuteSearch()
        
        showRandomKeywordInSelectedButton(sender: sender)
    }
    
    func showRandomKeywordInSelectedButton(sender: UIButton) {
        while true {
            guard let randomKeyword = newlyCoinedWordList.randomElement()?.key else {return}
            
            if randomKeyword != firstAutoInputButton.currentTitle && randomKeyword != secondAutoInputButton.currentTitle && randomKeyword != thirdAutoInputButton.currentTitle && randomKeyword != fourthAutoInputButton.currentTitle {
                sender.setTitle(randomKeyword, for: .normal)
                break
            }
        }
    }
}

