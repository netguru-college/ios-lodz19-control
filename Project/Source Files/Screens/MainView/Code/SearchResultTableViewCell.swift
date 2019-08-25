//
//  SearchResultTableViewCell.swift
//  NetguruCollegeApp
//

import UIKit

final class SearchResultTableViewCell: UITableViewCell {
    @IBOutlet var logoImageView: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var language: UILabel!
    @IBOutlet var repoDescription: UILabel!
    @IBOutlet var dateLabel: UILabel!

    private enum Constant {
        static let titleSize: CGFloat = 14.0
        static let descriptionSize: CGFloat = 12.0
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        setup()
    }

    private func setup() {
        name.font = .systemFont(ofSize: Constant.titleSize, weight: .bold)
        repoDescription.font = .systemFont(ofSize: Constant.descriptionSize, weight: .regular)
        language.font = .systemFont(ofSize: Constant.descriptionSize, weight: .regular)
        dateLabel.font = .systemFont(ofSize: Constant.descriptionSize, weight: .regular)
    }

    func updateData(with model: MainViewModel.RepositoryCellModel) {
        name.text = model.name
        repoDescription.text = model.description
        language.text = model.language
        dateLabel.text = model.lastUpdateOn
    }
}
