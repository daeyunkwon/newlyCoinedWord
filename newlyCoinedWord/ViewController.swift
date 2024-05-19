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
        setupTapGesture()
        setupUIView()
        setupUITextField()
        setupUIButton()
        setupUIImageView()
        setupUILabel()
    }
    
    //MARK: - Configurations
    
    func setupTapGesture() {
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self
             
        self.view.addGestureRecognizer(tapGesture)
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
    
    func setupUIImageView() {
        backImageView.image = UIImage.background
        backImageView.contentMode = .scaleAspectFill
    }
    
    func setupUILabel() {
        searchResultLabel.text = "연애를 시작하기 전 썸 단계!"
        searchResultLabel.textAlignment = .center
        searchResultLabel.numberOfLines = 0
    }
    
    func configureAutoInputButton(button: UIButton, titleText: String) {
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.tintColor = .black
        button.layer.cornerRadius = 12
        button.setTitle(titleText, for: .normal)
    }
    
    //MARK: - Functions
    
    @IBAction func searchTextFieldReturnTapped(_ sender: UITextField) {
        guard let searchText = sender.text else {return}
        showNewlyCoinedWordMeaning(newlyCoinedWord: searchText)
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        guard let searchText = searchTextField.text else {return}
        showNewlyCoinedWordMeaning(newlyCoinedWord: searchText)
    }
    
    func showNewlyCoinedWordMeaning(newlyCoinedWord: String) {
        guard let meaning = newlyCoinedWordList[newlyCoinedWord] else {
            searchResultLabel.text = "검색결과가 없습니다."
            return
        }
        
        searchResultLabel.text = meaning
    }
    
    @IBAction func autoInputButtonTapped(_ sender: UIButton) {
        let newlyCoinedWord = sender.currentTitle
        
        searchTextField.text = newlyCoinedWord
        
        switch newlyCoinedWord {
        case "윰차":
            searchResultLabel.text = "유명인과 무명인을 차별한다!"
        case "실매":
            searchResultLabel.text = "실시간 매니저!"
        case "만반잘부":
            searchResultLabel.text = "만나서 반가워 잘 부탁해!"
        case "꾸안꾸":
            searchResultLabel.text = "꾸민 듯 안 꾸민 듯!"
        default: break
        }
    }
}

//MARK: - UIGestureRecognizerDelegate

extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        self.view.endEditing(true)
        return true
    }
}
