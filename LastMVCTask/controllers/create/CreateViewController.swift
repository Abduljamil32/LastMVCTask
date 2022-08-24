//
//  CreateViewController.swift
//  LastMVCTask
//
//  Created by Avaz Mukhitdinov on 24/08/22.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet weak var justLabel: UILabel!
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var bodyText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - FUNCTIONS

    func apiCreatePost(post: Post, handler: @escaping (Bool)-> Void){
        AFHttp.post(url: AFHttp.API_POST_CREATE, params: AFHttp.paramsPostCreate(post: post), handler: { response in
            switch response.result{
            case .success:
                print(response.result)
                handler(true)
            case let .failure(error):
                handler(false)
                print(error)
            }
        })
    }
    
    // MARK: - ACTIONS
    

    @IBAction func createTapped(_ sender: Any) {
        apiCreatePost(post: Post(title: titleText.text!, body: bodyText.text!), handler: {isCreated in
            if isCreated {
                self.navigationController?.popViewController(animated: true)
            }
        })
    }
}
