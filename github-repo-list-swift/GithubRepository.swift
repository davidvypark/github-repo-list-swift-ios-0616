//
//  FISGithubRepository.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubRepository {
	
	var fullName = NSString()
	var html = NSURL()
	var repositoryID = NSString()
	
	init(dictionary: [String: AnyObject]) {
	
		guard let
		name = dictionary["full_name"],
		dictURL = dictionary["html_url"],
		url = NSURL(string: dictURL as! String),
		repoID = dictionary["id"]
			else { fatalError("error")
		}
		
		fullName = name as! NSString
		html = url
		repositoryID = String(repoID)
		
		
	}
}
