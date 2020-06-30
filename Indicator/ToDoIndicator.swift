//
//  ToDoIndicator.swift
//  Zoom-MVP
//
//  Created by Mohamed Arafa on 6/30/20.
//  Copyright © 2020 SolxFy. All rights reserved.
//

import Foundation
import Alamofire

class ToDoIndicator{
    
    func getToDosTitles(completion: @escaping ([GetToDo]?, Error?) -> ()){
        
        let url = "https://jsonplaceholder.typicode.com/todos"
        
        AF.request(url, method: .get, encoding: JSONEncoding.default).responseJSON { (response) in
            
            switch response.result{
                
            case .success(_):
                
                do{
                    
                    guard let data = response.data else {return}
                    
                    let result = try JSONDecoder().decode([GetToDo].self, from: data)
                    
                    completion(result, nil)
                    
                }catch{
                    completion(nil, error)
                }
                
            case .failure(_):
                completion(nil, response.error)
            }
            
        }
        
    }
}
