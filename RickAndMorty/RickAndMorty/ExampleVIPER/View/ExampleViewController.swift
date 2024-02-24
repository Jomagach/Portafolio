//
//  ExampleViewController.swift
//  RickAndMorty
//
//  Created by Jose Manuel Garcia Chavez on 22/02/24.
//


import UIKit

// MARK: ExampleViewController
final class ExampleViewController: UIViewController {

    // MARK: - Public properties -
    var eventHandler: ExamplePresenter!
    
    //MARK: Variables
    var items: [Character]? = nil
    
    var tableViewExample : UITableView = {
        let table = UITableView(frame: .zero)
        table.backgroundColor = .clear
        table.allowsSelection = false
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(CustomTableViewCell.self, forCellReuseIdentifier: "cellID")
        return table
    }()

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTable()
        eventHandler.fetchData()
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
}

// MARK: - View setups -
extension ExampleViewController {
    
    func setupView(){
        self.view.backgroundColor = RickAndMortyColors.palette1
    }
    
    
    func setupTable() {
        self.view.addSubview(tableViewExample)
        tableViewExample.delegate = self
        tableViewExample.dataSource = self
        tableViewExample.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableViewExample.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tableViewExample.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableViewExample.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
}

// MARK: - Extensions -
extension ExampleViewController: ExampleView {
    func showCharacter(characters: [Character]?) {
        self.items = characters
        tableViewExample.reloadData()
    }
    
    func appendData(characters: [Character]?) {
        guard let newCharacters = characters else { return}
        self.items?.append(contentsOf: newCharacters)
        tableViewExample.reloadData()
    }
    
}

//MARK: Table delegates

extension ExampleViewController : UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CustomTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cellID") as? CustomTableViewCell
        if indexPath.row == (items?.count ?? 0) - 1 {
            let cell: CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! CustomTableViewCell
              eventHandler.handleNextPage()
              return cell
            }
        if let data = items?[indexPath.row]{
            cell?.setData(image: data.image, name: data.name, statusSpecie: "\(data.status) - \(data.species)", location: data.location.name, episode: data.origin.name)
        }
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    
}


