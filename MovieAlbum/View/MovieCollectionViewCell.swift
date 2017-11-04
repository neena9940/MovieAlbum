//
//  MovieCollectionViewCell.swift
//  MovieAlbum
//
//  Created by Nina Yousefi on 10/25/17.
//  Copyright © 2017 Nina Yousefi. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var runTimeLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func setContentWith(movie: DTOMovie) {
        bottomView.layer.cornerRadius = 5
        imageView.layer.cornerRadius = 5
        
        titleLabel.text = movie.name
        if let genresList = movie.genres {
            print(genresList)
            genreLabel.text = genresList
        }
        if let runTime = movie.runtime {
            let hour = runTime / 60
            let hourStr = String(format:"%.0f", hour)
            let minute = runTime.truncatingRemainder(dividingBy: 60)
            let minuteStr = String(format:"%.0f", minute)
            if hour == 0 {
                runTimeLabel.text = "\(minuteStr) min"
            }
            if minute == 0 {
                runTimeLabel.text = "\(hourStr) hour"
            }
            if minute != 0 && hour != 0 {
                runTimeLabel.text = "\(hourStr) hour \(minuteStr) min"
            }
        }
        let text = movie.summary?.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        summaryTextView.text = text
        if let likeCount = movie.weight {
            likeCountLabel.text = String(describing: likeCount)
            commentCountLabel.text = String(describing: likeCount)
        }
        if let rating = movie.rating {
            ratingLabel.text = String(describing: rating)
        }
        
        if let imageUrl = URL(string: (movie.image?.original)!) {
            imageView.af_setImage(withURL: imageUrl, placeholderImage: UIImage(named: "three_dots" ))
        }
        
        
    }
}
