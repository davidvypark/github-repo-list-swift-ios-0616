//
//  FISReposTableViewController.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {
	
	let store = ReposDataStore.sharedInstance
	var listOfRepos = [GithubRepository]()
	
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.accessibilityLabel = "tableView"
		
		store.getRepositoriesWithCompletion {
			self.listOfRepos = self.store.githubReposArray
			
			dispatch_async(dispatch_get_main_queue()) {
				self.tableView.reloadData()
			}
		}
    }
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return listOfRepos.count
		
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCellWithIdentifier("repoCell", forIndexPath: indexPath)
		cell.textLabel!.text = listOfRepos[indexPath.row].fullName as String
		
		return cell
	}
 

}
