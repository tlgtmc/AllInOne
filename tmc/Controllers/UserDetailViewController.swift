//
//  UserDetailViewController.swift
//  tmc
//
//  Created by Tolga Atmaca on 10.03.2020.
//  Copyright © 2020 Tolga Atmaca. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelPhone: UILabel!
    @IBOutlet weak var labelWebsite: UILabel!
    @IBOutlet weak var labelLat: UILabel!
    @IBOutlet weak var labelLng: UILabel!
    
    @IBOutlet weak var labelCompanyTitle: UILabel!
    @IBOutlet weak var labelCompany: UILabel!
    @IBOutlet weak var labelAddress: UILabel!
    var user: User?
    
    @IBOutlet weak var buttonPosts: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFields()
        self.title = "User Detail"
    }
    
    func setFields() {
        labelName.text = user?.name
        labelUserName.text = user?.username
        labelEmail.text = user?.email
        labelPhone.text = user?.phone
        labelWebsite.text = user?.website
        
        labelLat.text = "Lat:"
        labelLat.text! += (user?.address?.geo?.lat)!
        
        labelLng.text = "Lng:"
        labelLng.text! += (user?.address?.geo?.lng)!
        
        labelAddress.text = user?.getAddressStr()
        labelCompanyTitle.text = user?.company?.name
        labelCompany.text = user?.getCompanyStr()
        
        buttonPosts.roundButton(15, .tmc1, 1)
        
    }
    
    func setUser(_user: User) {
        user = _user
    }
    
    @IBAction func buttonPostsAction(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "postsSegue" {
            let postsVC = segue.destination as? PostsTableViewController
            postsVC?.setUserId(id: (user?.id!)!)
        }
    }
    
    
}
