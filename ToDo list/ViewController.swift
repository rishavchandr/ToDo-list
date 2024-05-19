//
//  ViewController.swift
//  ToDo list
//
//  Created by Rishav chandra on 19/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var tasks = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        // saving tasks using userdefaults
        if !UserDefaults().bool(forKey: "setup"){
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0,forKey: "count")
        }
        updateTask()
        loadTasks()
    }
    func updateTask() {
        tasks.removeAll()
        
        guard let count = UserDefaults.standard.value(forKey: "count") as? Int else {
            return
        }
        
        for x in 0..<count {
            if let task = UserDefaults.standard.string(forKey: "task_\(x)") {
                tasks.append(task)
            }
        }
        
        tableView.reloadData()
    }

    func didDeleteTask(at index: Int) {
           loadTasks()
       }
    func loadTasks() {
            let count = UserDefaults.standard.integer(forKey: "count")
            tasks = []
            for i in 0..<count {
                if let task = UserDefaults.standard.string(forKey: "task_\(i)") {
                    tasks.append(task)
                }
            }
            tableView.reloadData()
        }

    @IBAction func addTask(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(identifier: "entry") as! EntryViewController
        vc.title = "New Task"
        //vc.task = tasks[indexPath.row]
        vc.update  = {
            DispatchQueue.main.async {
                self.updateTask()
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath , animated: true)
        
        let vc = storyboard?.instantiateViewController(identifier: "task") as! TaskViewController
        vc.title = "New Task"
        vc.task = tasks[indexPath.row]
        vc.currentPosition = indexPath.row
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
    

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        return cell
    }
   
    
    
}

