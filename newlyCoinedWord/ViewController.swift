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
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: - Configurations
    
    func configureUI() {
        backView.backgroundColor = .white
        backView.layer.borderColor = UIColor.black.cgColor
        backView.layer.borderWidth = 2
        
        searchTextField.borderStyle = .none
        searchTextField.tintColor = .black
        searchTextField.text = "삼귀자"
        
        searchButton.backgroundColor = .black
        searchButton.tintColor = .white
        searchButton.setTitle("", for: .normal)
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .unspecified, scale: .default)
        let symbolImage = UIImage(systemName: "magnifyingglass", withConfiguration: symbolConfig)
        searchButton.setImage(symbolImage, for: .normal)
        
        firstAutoInputButton.setTitle("윰차", for: .normal)
        configureAutoInputButton(button: firstAutoInputButton)
        
        secondAutoInputButton.setTitle("실매", for: .normal)
        configureAutoInputButton(button: secondAutoInputButton)
        
        thirdAutoInputButton.setTitle("만만잘부", for: .normal)
        configureAutoInputButton(button: thirdAutoInputButton)
        
        fourthAutoInputButton.setTitle("꾸안꾸", for: .normal)
        configureAutoInputButton(button: fourthAutoInputButton)
        
        backImageView.image = UIImage.background
        backImageView.contentMode = .scaleAspectFill
        
        searchResultLabel.text = "연애를 시작하기 전 썸 단계!"
        searchResultLabel.textAlignment = .center
        searchResultLabel.numberOfLines = 0
    }
    
    func configureAutoInputButton(button: UIButton) {
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.tintColor = .black
        button.layer.cornerRadius = 12
    }
    
    //MARK: - Functions
    
    
    @IBAction func searchTextFieldReturnTapped(_ sender: UITextField) {
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func autoInputButtonTapped(_ sender: UIButton) {
    }
    
    
    
    
    
    


}

