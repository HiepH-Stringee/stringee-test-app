//
//  PostTableViewCell.swift
//  StringeeTest
//
//  Created by Hiệp Hoàng on 13/03/2024.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var body: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func present(_ post: PostElement) {
        self.title.text = post.title
        self.body.text = post.body
        self.avatar.clipsToBounds = true
        self.avatar.layer.cornerRadius = 25
        if let url = URL(string: "https://ui-avatars.com/api/?name=stringee") {
            URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
                guard let data = data else { return }
                DispatchQueue.main.async {
                    self?.avatar.image = .init(data: data)
                }
            }.resume()
        }
    }
    
    class func heightForElement(_ post: PostElement) -> CGFloat {
        let width = UIScreen.main.bounds.width - (16 * 3 + 50)
        return post.title.height(withConstrainedWidth: width, font: .systemFont(ofSize: 17))
        + post.body.height(withConstrainedWidth: width, font: .systemFont(ofSize: 14)) + 16 * 3
    }
}

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
}
