//
//  ViewController.swift
//  TwitterLoginBankingIE
//
//  Created by Naveen Lingaiah on 17/02/2017.
//  Copyright © 2017 Naveen Lingaiah. All rights reserved.
//

import UIKit
import TwitterKit

class ViewController: UIViewController {
    
    var userSession: TWTRSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func twitterLoginBtn(_ sender: UIButton) {
        
        Twitter.sharedInstance().logIn(withMethods: TWTRLoginMethod.webBased) { (session, error) in
            
            if error != nil{
                print("Twitter Login Error \(error?.localizedDescription)")
                return
            }
            
            if session != nil {
                self.userSession = session
                self.searchTweets()
            }
        }
    }
    
    func searchTweets(){
        
        let client = TWTRAPIClient(userID: userSession?.userID)
        
        
        let tweetStream = TWTRSearchTimelineDataSource(searchQuery: "Banking", apiClient: client, languageCode: nil, maxTweetsPerRequest: 10)
        
        let twitterStreamViewController = TwitterStreamViewController()
        
        twitterStreamViewController.dataSource = tweetStream
        
        self.present(twitterStreamViewController, animated: true) {
            
            print("displaying Tweets")
            
        }
        
        
    }
    
}



