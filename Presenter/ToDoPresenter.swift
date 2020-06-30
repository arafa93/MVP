//
//  ToDoPresenter.swift
//  Zoom-MVP
//
//  Created by Mohamed Arafa on 6/30/20.
//  Copyright © 2020 SolxFy. All rights reserved.
//

import Foundation

protocol getToDos {
    func showHud()
    func dismissHud()
    func getDataSuccessfully()
    func showError(error: String)
    
    func navigate(todo: String)
}

protocol reloadCellTitles {
    func reloadTitle(title: String)
}

class ToDoPresenter{
    
    private var view: getToDos?
    private var toDoIndicator = ToDoIndicator()
    private var todos = [GetToDo]()
    
    init(view: getToDos) {
        self.view = view
    }
    
    
    func getToDos(){
        view?.showHud()
        toDoIndicator.getToDosTitles { [weak self] (titles, error) in
            guard let self = self else {return}
            
            self.view?.dismissHud()
            
            if error != nil{
                self.view?.showError(error: error!.localizedDescription)
                return
            }
            
            guard let todos = titles else {return}
            self.todos = todos
            
            self.view?.getDataSuccessfully()
        }
    }
    
    func titlesCount() -> Int{
        return todos.count
    }

    func reloadTitles(cell: reloadCellTitles, index: Int){
        cell.reloadTitle(title: todos[index].title ?? "")
    }
    
    func didSelect(index: Int){
        view?.navigate(todo: todos[index].title ?? "")
    }
    
}
