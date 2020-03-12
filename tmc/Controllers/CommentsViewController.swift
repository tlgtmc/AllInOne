//
//  CommentsViewController.swift
//  tmc
//
//  Created by Tolga Atmaca on 11.03.2020.
//  Copyright © 2020 Tolga Atmaca. All rights reserved.
//

import UIKit
import ObjectMapper

class CommentsViewController: UIViewController {
    
    @IBOutlet weak var labelPostTitle: UILabel!
    @IBOutlet weak var labelPostData: UILabel!
    @IBOutlet weak var tableViewComments: UITableView!
    
    var post: Post?
    
    var comments: [Comment] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Comments"
        self.tableViewComments.delegate = self
        self.tableViewComments.dataSource = self
        setPostData()
        
        if NetworkHelper.isConnectedToInternet() {
            fetchAndSetComments()
        } else {
            self.tableViewComments.setEmptyTableView(false)
        }
        setPullToRefresh()
    }
    
    func setPostData() {
        labelPostTitle.text = post?.title
        labelPostData.text = post?.body
    }
    
    func fetchAndSetComments() {
        self.showProgress()
         ApiHelper.Instance.call(url: Commons.URL_COMMENTS) { response in
            switch (response.result) {
            case .success:
                let comments = Mapper<Comment>().mapArray(JSONArray: response.result.value as! [[String : Any]])
                DispatchQueue.main.async {
                    self.setComments(_comments: comments)
                }
            case .failure( let error):
                self.hideActiveProgress()
                self.showError("Could not get the Comment data. Please try again...")
                print(error)
            }
        }
    }
    
    func setComments(_comments: [Comment]) {
        print("Count: \(_comments.count)")
        comments = _comments.filter{$0.postId == post?.id}
        print("Post's Comment Count: \(comments.count)")
        self.tableViewComments.reloadData()
        self.hideActiveProgress()
    }
    
    func setPost(_post: Post) {
        post = _post
    }
    
    
    func setPullToRefresh() {
        self.tableViewComments.refreshControl = UIRefreshControl()
        self.tableViewComments.refreshControl!.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.tableViewComments.refreshControl!.addTarget(self, action: #selector(refresh), for: .valueChanged)
        self.tableViewComments.addSubview(self.tableViewComments.refreshControl!)
    }
    
    @objc func refresh(_ sender: Any) {
        self.tableViewComments.refreshControl?.endRefreshing()
        fetchAndSetComments()
    }
}


extension CommentsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! CommentCell
            
        cell.labelName.text = comments[indexPath.row].name!
        cell.labelEmail.text = comments[indexPath.row].email!
        cell.labelComment.text = comments[indexPath.row].body!
        
        if indexPath.row % 2 != 0 {
            cell.contentView.backgroundColor = UIColor.pastel1
        } else {
            cell.contentView.backgroundColor = UIColor.pastel2
        }
        
        return cell
    }
    
}

