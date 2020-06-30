//
//  ViewController.swift
//  Zoom-MVP
//
//  Created by Mohamed Arafa on 6/30/20.
//  Copyright © 2020 SolxFy. All rights reserved.
//

import UIKit

class ToDoVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ToDoPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = ToDoPresenter(view: self)
        presenter.getToDos()
    }

}

extension ToDoVC: getToDos{
    
    func showHud() {
        Hud.show()
    }
    
    func dismissHud() {
        Hud.dismiss()
    }
    
    func getDataSuccessfully() {
        tableView.reloadData()
    }
    
    func showError(error: String) {
        print(error)
    }
    
    func navigate(todo: String) {
        self.navigationController?.pushViewController(UIViewController(), animated: true)
    }
    
}

extension ToDoVC: UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.titlesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! toDoTCell
        
        presenter.reloadTitles(cell: cell, index: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didSelect(index: indexPath.row)
    }
}
