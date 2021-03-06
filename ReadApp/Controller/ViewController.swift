//
//  ViewController.swift
//  ReadApp
//
//  Created by Mohamed on 2/17/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK:- Outlet
    @IBOutlet weak var customeView: UIView!
    @IBOutlet weak var searchBookTextfiled: UITextField!
    @IBOutlet weak var searchButton: UIButton!
        
    
    //MARK:- App life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        searchBookTextfiled.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
        enableHero()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        disableHero()
    }
    
    //MARK:- Class Methods
    
    func setupUI() {
        
        self.hideKeyboardWhenTappedAround()
        customeView.layer.cornerRadius = 35
        customeView.layer.masksToBounds = true
        customeView.layer.shadowColor = UIColor.black.cgColor
        customeView.layer.shadowOpacity = 0.8
        customeView.layer.shadowOffset = .zero
        customeView.layer.shadowRadius = 10
        searchBookTextfiled.layer.cornerRadius = 15
        searchBookTextfiled.layer.borderWidth = 2
        searchBookTextfiled.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        searchBookTextfiled.layer.masksToBounds = true
        searchButton.layer.cornerRadius = searchButton.frame.height / 2

    }
    
    func ValidataTextFiled() {
        
        if searchBookTextfiled.text!.isEmpty {
            
            self.showAlert()
        }
        else {
            pushToShowBookVc()
        }
        
    }
    
    func addBorder() {
        searchBookTextfiled.layer.borderWidth = 2
        searchBookTextfiled.layer.borderColor = #colorLiteral(red: 0.1818112433, green: 0.2389135957, blue: 0.4014489651, alpha: 1)
    }
    
    func removeBorder() {
        searchBookTextfiled.layer.borderWidth = 2
        searchBookTextfiled.layer.borderColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == searchBookTextfiled {
            addBorder()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        removeBorder()
    }
    
    func pushToShowBookVc() {
        let bookshowVc = storyboard?.instantiateViewController(withIdentifier: "ShowBooksVc") as! ShowBooksVc
        
        bookshowVc.searchText = searchBookTextfiled.text
        bookshowVc.title = searchBookTextfiled.text
//        navigationController?.pushViewController(bookshowVc, animated: true)
        self.searchButton.heroID = "buttonSearch"
        self.showHero(bookshowVc)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        ValidataTextFiled()
        return true
    }
    
    
    
    
    //MARK: - IB Actions
    
    @IBAction func searchButtonTap(_ sender: Any) {
        
        ValidataTextFiled()
    }
    
   
    
    
    
    
    
}
//MARK:- Extension

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
extension UIViewController {
    
    func showAlert() {
        
        let vc = AlertControllerVc()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true, completion: nil)
        
    }
}

