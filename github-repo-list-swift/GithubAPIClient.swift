//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
	
	let githubURL = NSURL(string: URLString)
	let reposArray = [String]()
	
	class func getRepositoriesWithCompletion(completion: (NSArray) -> ()) {
		
		let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
		
		if let githubURL = NSURL(string: URLString) {
			let githubTask = session.dataTaskWithURL(githubURL, completionHandler: { (data, response, error) in
				
				if let data = data {
					do {
						let responseData = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSArray
						completion(responseData)
						
					} catch {
						print("error")
					}
				}
			})
			githubTask.resume()
		}
	}
}

