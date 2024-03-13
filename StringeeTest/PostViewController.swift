//
//  PostViewController.swift
//  StringeeTest
//
//  Created by Hiệp Hoàng on 13/03/2024.
//

import UIKit

import Foundation

// MARK: - PostElement
struct PostElement: Codable {
    let id, userID: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case title, body
    }
}

typealias Posts = [PostElement]

class PostViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tblView: UITableView!
    
    var post = Posts()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
        tblView.estimatedRowHeight = 0
        tblView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
        
        if let url = URL(string: "https://gorest.co.in/public/v2/posts") {
            let task = URLSession.shared.dataTask(with: url) {[weak self] (data, response, error) in
                guard let data = data else { return }
                self?.post = (try? JSONDecoder().decode(Posts.self, from: data)) ?? []
                DispatchQueue.main.async {
                    self?.tblView.reloadData()
                }
            }
            task.resume()
        }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.post.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell {
            cell.present(post[indexPath.row])
            return cell
        }
        fatalError()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        PostTableViewCell.heightForElement(post[indexPath.row])
    }
    

}
