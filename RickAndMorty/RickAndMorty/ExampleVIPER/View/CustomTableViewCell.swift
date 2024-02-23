//
//  CustomTableViewCell.swift
//  RickAndMorty
//
//  Created by Jose Manuel Garcia Chavez on 22/02/24.
//

import UIKit
import Kingfisher

// MARK: CustomTableViewCell 
class CustomTableViewCell: UITableViewCell {
    
    // MARK: - Public variables -
    let padding : CGFloat = 10.0
    let paddingContent : CGFloat = 5.0
    let paddingService : CGFloat = 20.0
    let avatarHeight: CGFloat = 150.0
    let avatarWidth : CGFloat = 150.0
    let cornerRadius : CGFloat = 10.0
    
    // MARK: - Private properties -
    private lazy var viewContainer : UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = RickAndMortyColors.palette5
        view.layer.cornerRadius = self.cornerRadius
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var avatarImageView : UIImageView = {
        let view = UIImageView(frame: .zero)
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.cornerRadius = self.cornerRadius
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var nameLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.font = UIFont(name: "Sono-Bold", size: 14)
        label.textColor = RickAndMortyColors.palette1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var statusSpecieLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.font = UIFont(name: "Sono-Regular", size: 12)
        label.textColor = RickAndMortyColors.palette1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var locationTitleLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.font = UIFont(name: "Sono-Light", size: 12)
        label.textColor = RickAndMortyColors.palette2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Last known location:"
        return label
    }()
    
    private var locationValueLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.font = UIFont(name: "Sono-Regular", size: 12)
        label.textColor = RickAndMortyColors.palette1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var episodeTitleLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.font = UIFont(name: "Sono-Light", size: 12)
        label.textColor = RickAndMortyColors.palette2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "First seen in:"
        return label
    }()
    
    private var episodeValueLabel : UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.font = UIFont(name: "Sono-Regular", size: 12)
        label.textColor = RickAndMortyColors.palette1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Setup properties -
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        avatarImageView.kf.cancelDownloadTask()
        avatarImageView.kf.setImage(with: URL(string: ""))
        avatarImageView.image = nil
    }
    
    func setupViews(){
        self.backgroundColor = .clear
        
        self.addSubview(viewContainer)
        viewContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: padding).isActive = true
        viewContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding).isActive = true
        viewContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding).isActive = true
        viewContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding).isActive = true
        
        viewContainer.addSubview(avatarImageView)
        avatarImageView.centerYAnchor.constraint(equalTo: viewContainer.centerYAnchor).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: avatarWidth).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: avatarHeight).isActive = true
        
        viewContainer.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: padding).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: padding).isActive = true
        nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: viewContainer.trailingAnchor, constant: -padding).isActive = true
        
        viewContainer.addSubview(statusSpecieLabel)
        statusSpecieLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: paddingContent).isActive = true
        statusSpecieLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: padding).isActive = true
        statusSpecieLabel.trailingAnchor.constraint(lessThanOrEqualTo: viewContainer.trailingAnchor, constant: -padding).isActive = true
        
        viewContainer.addSubview(locationTitleLabel)
        locationTitleLabel.topAnchor.constraint(equalTo: statusSpecieLabel.bottomAnchor, constant: paddingService).isActive = true
        locationTitleLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: padding).isActive = true
        locationTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: viewContainer.trailingAnchor, constant: -padding).isActive = true
        
        viewContainer.addSubview(locationValueLabel)
        locationValueLabel.topAnchor.constraint(equalTo: locationTitleLabel.bottomAnchor, constant: paddingContent).isActive = true
        locationValueLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: padding).isActive = true
        locationValueLabel.trailingAnchor.constraint(lessThanOrEqualTo: viewContainer.trailingAnchor, constant: -padding).isActive = true
        
        viewContainer.addSubview(episodeTitleLabel)
        episodeTitleLabel.topAnchor.constraint(equalTo: locationValueLabel.bottomAnchor, constant: paddingService).isActive = true
        episodeTitleLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: padding).isActive = true
        episodeTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: viewContainer.trailingAnchor, constant: -padding).isActive = true
        
        viewContainer.addSubview(episodeValueLabel)
        episodeValueLabel.topAnchor.constraint(equalTo: episodeTitleLabel.bottomAnchor, constant: paddingContent).isActive = true
        episodeValueLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: padding).isActive = true
        episodeValueLabel.trailingAnchor.constraint(lessThanOrEqualTo: viewContainer.trailingAnchor, constant: -padding).isActive = true
        
        episodeValueLabel.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor,constant: -padding).isActive = true
    }
    
    func setData(
        image: String,
        name: String,
        statusSpecie: String,
        location: String,
        episode: String) {
            let urlImage: URL? = URL(string: image)
            self.avatarImageView.kf.setImage(with: urlImage) { result in
                self.layoutSubviews()
            }
            self.nameLabel.text = name
            self.statusSpecieLabel.text = statusSpecie
            self.locationValueLabel.text = location
            self.episodeValueLabel.text = episode
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.setNeedsLayout()
        contentView.layoutIfNeeded()
        viewContainer.setNeedsLayout()
        viewContainer.layoutIfNeeded()
        viewContainer.addShadow()
    }
    

}
