//
//  ViewController.swift
//  ClientServerExercise15Oct2018
//
//  Created by Kamaluddin Khan on 17/10/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController {
    let urlStringForPopularity = "https://api.themoviedb.org/3/discover/movie?api_key=114fe6670282f6a632638661e5e86dee&sort_by=popularity.desc"
    let urlStringForVoteAverage = "https://api.themoviedb.org/3/discover/movie?api_key=114fe6670282f6a632638661e5e86dee&sort_by=vote_average.desc"
    let urlStringForRevenue =  "https://api.themoviedb.org/3/discover/movie?api_key=114fe6670282f6a632638661e5e86dee&sort_by=revenue.desc"
    @IBOutlet weak var movieTableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let movieListCellNib = UINib(nibName: "MovieListCell", bundle: nil)
        movieTableView?.register(movieListCellNib, forCellReuseIdentifier: "MovieListCell")
        movieTableView?.rowHeight = 230
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieCell = movieTableView?.dequeueReusableCell(withIdentifier: "MovieListCell") as! MovieListCell
        //Mark:- Sort by Popular Movie
        if indexPath.section == 0{
            movieCell.apiCall(url: urlStringForPopularity)
        }
        //Mark:- Sort by Vote Average
        if indexPath.section == 1{
             movieCell.apiCall(url: urlStringForVoteAverage)
        }
        //Mark:- Sort by Revenue
        if indexPath.section == 2{
            movieCell.apiCall(url: urlStringForRevenue)
        }
        return movieCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Popular Movies"
        }
        if section == 1 {
            return "Vote Average Movies"
        }
        return "Revenue Movies"
    }
}

