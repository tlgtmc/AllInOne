//
//  ApiHelper.swift
//  tmc
//
//  Created by Tolga Atmaca on 10.03.2020.
//  Copyright © 2020 Tolga Atmaca. All rights reserved.
//


import Alamofire
import ObjectMapper
import Toast_Swift

class ApiHelper {
    
    static let Instance = ApiHelper()

    
    /*func fetchUsers(view: UsersTableViewController) {
        Alamofire.request(Commons.URL_USERS,
                          method: .get,
                          encoding: JSONEncoding.default)
            .responseJSON {(response) in

                switch (response.result) {
                case .success:
                    let users = Mapper<User>().mapArray(JSONArray: response.result.value as! [[String : Any]])
                    DispatchQueue.main.async {
                        view.setUserData(users: users)
                    }
                case .failure( let error):
                    view.hideActiveProgress()
                    view.showError("Could not get the User data. Please try again...")
                    print(error)
                }
        }
    }
    
    
    func fetchAndReturnUsers(completion: @escaping (DataResponse<Any>) -> Void)  {
        Alamofire.request(Commons.URL_USERS,
                          method: .get,
                          encoding: JSONEncoding.default)
            .responseJSON {(response) in
                completion(response)
        }
    }
    */
    /*func fetchPosts(view: PostsTableViewController) {
        
        Alamofire.request(Commons.URL_POSTS,
                          method: .get,
                          encoding: JSONEncoding.default)
            .responseJSON {(response) in
                switch (response.result) {
                case .success:
                    let posts = Mapper<Post>().mapArray(JSONArray: response.result.value as! [[String : Any]])
                    DispatchQueue.main.async {
                        view.setPosts(_posts: posts)
                    }
                case .failure( let error):
                    view.hideActiveProgress()
                    view.showError("Could not get the Post data. Please try again...")
                    print(error)
                }
        }
    }*/
    
    
    func call(url: String, completion: @escaping (DataResponse<Any>) -> Void)  {
        Alamofire.request(url,
                          method: .get,
                          encoding: JSONEncoding.default)
            .responseJSON {(response) in
                completion(response)
        }
    }
    
    /*func fetchComments(view: CommentsViewController) {
        
        Alamofire.request(Commons.URL_COMMENTS,
                          method: .get,
                          encoding: JSONEncoding.default)
            .responseJSON {(response) in
                switch (response.result) {
                case .success:
                    let comments = Mapper<Comment>().mapArray(JSONArray: response.result.value as! [[String : Any]])
                    DispatchQueue.main.async {
                        view.setComments(_comments: comments)
                    }
                case .failure( let error):
                    view.hideActiveProgress()
                    view.showError("Could not get the Comment data. Please try again...")
                    print(error)
                }
        }
    }*/
    
}
