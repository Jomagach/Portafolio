//
//  CharacterViewController.swift
//  RickAndMorty
//
//  Created by Jose Manuel Garcia Chavez on 26/02/24.
//


import UIKit

final class CharacterViewController: UIViewController {

    // MARK: - Public properties -
    var eventHandler: CharacterPresenter!
    
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
        label.text = "Episodes:"
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

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        self.eventHandler.fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    func setupViews(){
        self.view.backgroundColor = RickAndMortyColors.palette1
        self.view.addSubview(viewContainer)
        viewContainer.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: padding).isActive = true
        viewContainer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: padding).isActive = true
        viewContainer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -padding).isActive = true
        viewContainer.bottomAnchor.constraint(lessThanOrEqualTo: self.view.bottomAnchor).isActive = true
        
        viewContainer.addSubview(avatarImageView)
        avatarImageView.topAnchor.constraint(equalTo: viewContainer.topAnchor, constant: padding).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor).isActive = true
        avatarImageView.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor).isActive = true
        avatarImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 300).isActive = true
        
        viewContainer.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: padding).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: padding).isActive = true
        nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: viewContainer.trailingAnchor, constant: -padding).isActive = true
        
        viewContainer.addSubview(statusSpecieLabel)
        statusSpecieLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: paddingContent).isActive = true
        statusSpecieLabel.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: padding).isActive = true
        statusSpecieLabel.trailingAnchor.constraint(lessThanOrEqualTo: viewContainer.trailingAnchor, constant: -padding).isActive = true
        
        viewContainer.addSubview(locationTitleLabel)
        locationTitleLabel.topAnchor.constraint(equalTo: statusSpecieLabel.bottomAnchor, constant: paddingService).isActive = true
        locationTitleLabel.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: padding).isActive = true
        locationTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: viewContainer.trailingAnchor, constant: -padding).isActive = true
        
        viewContainer.addSubview(locationValueLabel)
        locationValueLabel.topAnchor.constraint(equalTo: locationTitleLabel.bottomAnchor, constant: paddingContent).isActive = true
        locationValueLabel.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: padding).isActive = true
        locationValueLabel.trailingAnchor.constraint(lessThanOrEqualTo: viewContainer.trailingAnchor, constant: -padding).isActive = true
        
        viewContainer.addSubview(episodeTitleLabel)
        episodeTitleLabel.topAnchor.constraint(equalTo: locationValueLabel.bottomAnchor, constant: paddingService).isActive = true
        episodeTitleLabel.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: padding).isActive = true
        episodeTitleLabel.trailingAnchor.constraint(lessThanOrEqualTo: viewContainer.trailingAnchor, constant: -padding).isActive = true
        
        viewContainer.addSubview(episodeValueLabel)
        episodeValueLabel.topAnchor.constraint(equalTo: episodeTitleLabel.bottomAnchor, constant: paddingContent).isActive = true
        episodeValueLabel.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: padding).isActive = true
        episodeValueLabel.trailingAnchor.constraint(lessThanOrEqualTo: viewContainer.trailingAnchor, constant: -padding).isActive = true
        
        episodeValueLabel.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor,constant: -padding).isActive = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewContainer.setNeedsLayout()
        viewContainer.layoutIfNeeded()
        viewContainer.addShadow()
    }

}

// MARK: - Extensions -
extension CharacterViewController: CharacterView {
    func showCharacter(image: String,
                       name: String,
                       statusSpecie: String,
                       location: String,
                       episodes: [String]) {
        let urlImage: URL? = URL(string: image)
        self.avatarImageView.kf.setImage(with: urlImage)
        self.nameLabel.text = name
        self.statusSpecieLabel.text = statusSpecie
        self.locationValueLabel.text = location
        self.episodeValueLabel.text = episodes.joined(separator: "\n")
    }
    
}
