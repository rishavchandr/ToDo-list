//
//  TaskViewController.swift
//  ToDo list
//
//  Created by Rishav chandra on 19/05/24.
//

import UIKit

protocol TaskViewControllerDelegate: AnyObject {
    func didDeleteTask(at index: Int)
}

class TaskViewController: UIViewController {
    

    @IBOutlet weak var taskslabel: UILabel!
   
    var task: String?
    var currentPosition: Int?
    weak var delegate: TaskViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        taskslabel.text = task
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "delete", style: .done, target: self, action: #selector(deleteTask))
    }

    @objc func deleteTask(){
        guard let currentPosition = currentPosition else { return }

                let count = UserDefaults.standard.integer(forKey: "count")

                UserDefaults.standard.setValue(nil, forKey: "task_\(currentPosition)")

                for i in currentPosition..<count-1 {
                    if let nextTask = UserDefaults.standard.string(forKey: "task_\(i+1)") {
                        UserDefaults.standard.setValue(nextTask, forKey: "task_\(i)")
                    }
                }
                UserDefaults.standard.setValue(count-1, forKey: "count")
                UserDefaults.standard.setValue(nil, forKey: "task_\(count-1)")

                delegate?.didDeleteTask(at: currentPosition)

                navigationController?.popViewController(animated: true)
            }
        
    }

