//
//  EntryViewController.swift
//  ToDo list
//
//  Created by Rishav chandra on 20/05/24.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var section: UITextField!
    var update: (()->Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        section.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title:"save", style: .done, target: self, action: #selector(saveTask))
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    @objc func saveTask(){
        guard let text = section.text, !text.isEmpty else{
            return
        }
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        let newCount = count + 1
        UserDefaults().set(newCount, forKey: "count")
        UserDefaults().set(text, forKey: "task_\(newCount)")
        
        update?()
        navigationController?.popViewController(animated: true)
    }
}
