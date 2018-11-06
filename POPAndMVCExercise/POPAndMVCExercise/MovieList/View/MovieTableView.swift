//
//  MovieTableView.swift
//  POPAndMVCExercise
//
//  Created by Kamaluddin Khan on 25/10/18.
//  Copyright © 2018 Kamaluddin Khan. All rights reserved.
//

import UIKit

class MovieTableView: UIView {
    @IBOutlet weak var moviesTableView: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        nibRegistration()
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        moviesTableView.rowHeight = 140
//        moviesTableView.separatorColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
       
    }
}


extension MovieTableView: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let moviesTableViewCell = moviesTableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell") as! MoviesTableViewCell
        switch indexPath.section {
        case SectionNumber.Zero.rawValue:
            moviesTableViewCell.apiHandler(stringUrl: urlStringForPopularity)
        case SectionNumber.One.rawValue:
             moviesTableViewCell.apiHandler(stringUrl: urlStringForVoteAverage)
        case SectionNumber.Two.rawValue:
            moviesTableViewCell.apiHandler(stringUrl: urlStringForRevenue)
        default:
            print("No Section")
        }
        return moviesTableViewCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case SectionNumber.Zero.rawValue:
            return SectionTitle.Popular.rawValue
        case SectionNumber.One.rawValue:
            return SectionTitle.VoteAverage.rawValue
        case SectionNumber.Two.rawValue:
            return SectionTitle.ForRevenue.rawValue
        default:
            return "NO TITLE"
        }
    }
}


extension MovieTableView{
    //MARK:- Custome Cell Registration
    private func nibRegistration() {
        let movieCellNib = UINib(nibName: "MoviesTableViewCell", bundle: nil)
        moviesTableView.register(movieCellNib, forCellReuseIdentifier: "MoviesTableViewCell")
    }
    
    
}


