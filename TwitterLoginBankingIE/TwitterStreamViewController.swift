//
//  TWTRTimelineViewController.swift
//  TwitterLoginBankingIE
//
//  Created by Naveen Lingaiah on 17/02/2017.
//  Copyright © 2017 Naveen Lingaiah. All rights reserved.
//


import UIKit
import TwitterKit


class TwitterStreamViewController:  TWTRTimelineViewController {
    
     
    var twitterDataSource : TWTRSearchTimelineDataSource? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let twitterDataSource = twitterDataSource{
            self.dataSource = twitterDataSource
        }
    }
}
