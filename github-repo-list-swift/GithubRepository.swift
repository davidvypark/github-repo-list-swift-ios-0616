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
		
		//re "full_name", "id", and "html_url".
		
		if let name = dictionary["full_name"] {
			fullName = name as! NSString
		}
		
		if let dictURL = dictionary["html_url"] {
			if let url = NSURL(string: dictURL as! String) {
				html = url
			}
		}
		
		if let repoID = dictionary["id"] {
			repositoryID = String(repoID)
		}
	}
}
