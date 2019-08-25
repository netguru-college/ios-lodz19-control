//
//  PullRequestsViewController.swift
//  NetguruCollegeApp
//

import UIKit

final class PullRequestsViewController: UIViewController {

    private var customView: PullRequestsView {
        return view as! PullRequestsView
    }
    var pullRequests: [PullRequest] = []
    
    // MARK: - Functions

    init() {
        super.init(nibName: nil, bundle: nil)
        self.tabBarItem.title = "Pull Requests"
        self.tabBarItem.image = #imageLiteral(resourceName: "Pull_Requests")
        
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
        customView.tableView.register(PullRequestCell.self, forCellReuseIdentifier: "PullRequestCell")
        
        createPullRequestDataPlaceholders()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PullRequestsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pullRequests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = customView.tableView.dequeueReusableCell(withIdentifier: "PullRequestCell", for: indexPath)
        cell.textLabel?.text = pullRequests[indexPath.row].name
        if pullRequests[indexPath.row].status == .open {
            cell.backgroundColor = UIColor(red:0.48, green:0.93, blue:0.62, alpha:1.0)        } else {
            cell.backgroundColor = UIColor(red:0.98, green:0.69, blue:0.63, alpha:1.0)
        }
        return cell
    }
    
    func createPullRequestDataPlaceholders() {
        pullRequests.append(PullRequest(name: "Make push", status: .closed))
        pullRequests.append(PullRequest(name: "Go home", status: .closed))
        pullRequests.append(PullRequest(name: "Die", status: .open))
    }
    
}
