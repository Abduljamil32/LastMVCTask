//
//  Posts.swift
//  LastMVCTask
//
//  Created by Avaz Mukhitdinov on 24/08/22.
//

import Foundation


class Post: Decodable {
    
    var id: Int?
    var title: String? = ""
    var body: String? = ""
//    var userId: Int?
    
    init(title: String, body: String){
        
        self.title = title
        self.body = body
    }
    
    init(id: Int, title: String, body: String){
        self.id = id
        self.title = title
        self.body = body
    }
   
}
