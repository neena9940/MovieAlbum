//
//  MovieDetailsViewController.swift
//  MovieAlbum
//
//  Created by Nina Yousefi on 11/3/17.
//  Copyright © 2017 Nina Yousefi. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var runTimeLabel: UILabel!
    @IBOutlet weak var ratingeLabel: UILabel!
    @IBOutlet weak var summaryTextView: UITextView!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var writerLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var videoView: UIView!
    
    var currentMovie: DTOMovie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(currentMovie?.id!)
        // Do any additional setup after loading the view.
        self.title = "NOW PLAYING"
        if let movie = currentMovie {
            setContentWith(movie: movie)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setContentWith(movie: DTOMovie)
    {
        imageView.layer.cornerRadius = 5.0
        
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
        if let rating = movie.rating {
            let rate = String(describing: rating)
            ratingeLabel.text = "\(rate) / 10"
        }
        
        if let imageUrl = URL(string: (movie.image?.original)!) {
            imageView.af_setImage(withURL: imageUrl)
        }
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
