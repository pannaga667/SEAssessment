//
//  ViewController.swift
//  Assess
//
//  Created by Pannaga Bhushana on 13/02/21.
//

import UIKit
import PaginatedTableView

class AppHomeViewController: UIViewController {
    
    @IBOutlet weak var appHomeTableView: PaginatedTableView!
    @IBOutlet weak var appHomeSearchBar: UISearchBar!
    @IBOutlet weak var photosButton: UIButton!
    @IBOutlet weak var videosButton: UIButton!
    @IBOutlet weak var favoritesButton: UIButton!
    
    private var homeViewModel = AppHomeViewModel()
    var photos = [Photo]()
    var videos = [Video]()
    
    var list = [Int]()
    class var instance: AppHomeViewController {
        return StoryBoard.main.instantiateVC(AppHomeViewController.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appHomeTableView.register(UINib(nibName: "AppHomeTableViewCell", bundle: nil), forCellReuseIdentifier: "AppHomeTableViewCell")
        appHomeTableView.rowHeight = UITableView.automaticDimension
        appHomeTableView.paginatedDelegate = self
        appHomeTableView.paginatedDataSource = self
        appHomeTableView.enablePullToRefresh = true
        appHomeTableView.pullToRefreshTitle = NSAttributedString(string: "Pull to Refresh")
        appHomeTableView.loadData(refresh: true)
        appHomeSearchBar.showsScopeBar = true
        appHomeSearchBar.delegate = self
        self.homeViewModel.getPhotos(queryString: "Animal")
        self.setUpTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setUpTableView() {
        self.homeViewModel.photos.bind { [unowned self] response in
            self.photos = response?.photos ?? []
            DispatchQueue.main.async { [weak self] in
                self?.appHomeTableView.reloadData()
                
            }
        }
    }
    
    
}

extension AppHomeViewController: PaginatedTableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func loadMore(_ pageNumber: Int, _ pageSize: Int, onSuccess: ((Bool) -> Void)?, onError: ((Error) -> Void)?) {
        // Call your api here
        // Send true in onSuccess in case new data exists, sending false will disable pagination
        
        // If page number is first, reset the list
        if pageNumber == 1 { self.list = [Int]() }
        
        // else append the data to list
        let startFrom = (self.list.last ?? 0) + 1
        for number in startFrom..<(startFrom + pageSize) {
            self.list.append(number)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            onSuccess?(true)
        }
    }
}

//
// MARK: Paginated Data Source
//
extension AppHomeViewController: PaginatedTableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AppHomeTableViewCell", for: indexPath) as? AppHomeTableViewCell else {
            fatalError("The dequeued cell is not an instance of TableViewCell.")
        }
        cell.configure(data: photos[indexPath.row])
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
    }
}

extension AppHomeViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked( _ searchBar: UISearchBar)
    {
        self.homeViewModel.getPhotos(queryString: searchBar.text ?? "")
    }
}


