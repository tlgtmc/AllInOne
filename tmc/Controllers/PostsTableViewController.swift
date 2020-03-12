//
//  PostsTableViewController.swift
//  tmc
//
//  Created by Tolga Atmaca on 11.03.2020.
//  Copyright © 2020 Tolga Atmaca. All rights reserved.
//

import UIKit
import ObjectMapper

class PostsTableViewController: UITableViewController {
    
    var userId: Int = -1
    var posts: [Post] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Posts"
        
        if NetworkHelper.isConnectedToInternet() {
            fetchAndSetPosts()
        } else {
            self.tableView.setEmptyTableView(false)
        }
        setPullToRefresh()
    }
    
    func setUserId(id: Int) {
        userId = id
    }
    
    func fetchAndSetPosts() {
        self.showProgress()
        ApiHelper.Instance.call(url: Commons.URL_POSTS) { response in

            switch (response.result) {
            case .success:
                let posts = Mapper<Post>().mapArray(JSONArray: response.result.value as! [[String : Any]])
                self.setPosts(_posts: posts)
            case .failure( let error):
                self.hideActiveProgress()
                self.showError("Could not get the Post data. Please try again...")
                print(error)
            }
        }
    }
    
    
    func setPosts(_posts: [Post]) {
        print("Count: \(_posts.count)")
        posts = _posts.filter{$0.userId == userId}
        print("User's Post Count: \(posts.count)")
        self.tableView.reloadData()
        self.hideActiveProgress()
    }
    
    func setPullToRefresh() {
        self.refreshControl = UIRefreshControl()
        refreshControl!.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl!.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.addSubview(refreshControl!)
    }
    
    @objc func refresh(_ sender: Any) {
        self.refreshControl?.endRefreshing()
        fetchAndSetPosts()
    }
}


extension PostsTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostCell
            
        cell.labelTitle.text = posts[indexPath.row].title!
        cell.labelComment.text = posts[indexPath.row].body!
        
        cell.labelTitle.textColor = .tmc3
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "CommentsViewController") as! CommentsViewController
        newViewController.setPost(_post: posts[indexPath.row])
        newViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
}
