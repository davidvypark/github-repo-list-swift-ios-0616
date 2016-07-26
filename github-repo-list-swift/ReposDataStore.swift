//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
	var githubReposArray = [GithubRepository]()
	
	func getRepositoriesWithCompletion(completion: () -> ()) {
		GithubAPIClient.getRepositoriesWithCompletion { (reposArray) in
			self.githubReposArray.removeAll()
			
			for dictionary in reposArray {
				let repository = GithubRepository(dictionary: dictionary as! [String : AnyObject])
				self.githubReposArray.append(repository)
			}
			if self.githubReposArray.count > 0 {
				completion()
			}

		}
	}  

}
