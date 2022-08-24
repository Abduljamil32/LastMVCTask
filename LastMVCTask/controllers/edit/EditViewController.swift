//
//  EditViewController.swift
//  LastMVCTask

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var justTitle: UILabel!
    @IBOutlet weak var newTitle: UITextField!
    @IBOutlet weak var newBody: UITextField!
    
    var editPost: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // MARK: - FUNCTIONS
    
    func initView(){
        newTitle.text = editPost?.title
        newBody.text = editPost?.body
    }

    func apiEditPost(post: Post, handler: @escaping (Bool) -> Void){
        AFHttp.put(url: AFHttp.API_POST_UPDATE + String(post.id!), params: AFHttp.paramsPostUpdate(post: post), handler: { response in
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

    @IBAction func editTapped(_ sender: Any) {
        apiEditPost(post: Post(title: newTitle.text!, body: newBody.text!), handler: {isEdited in
            if isEdited{
                self.navigationController?.dismiss(animated: true)
            }
        })
    }
}
