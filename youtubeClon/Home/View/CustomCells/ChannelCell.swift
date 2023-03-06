//
//  ChannelCell.swift
//  youtubeClon
//
//  Created by Duver on 27/2/23.
//

import UIKit

class ChannelCell: UITableViewCell {

  
  @IBOutlet weak var bannerChannel: UIImageView!
  
  @IBOutlet weak var bellImage: UIImageView!
  @IBOutlet weak var infoLabel: UILabel!
  @IBOutlet weak var subscriptorsLabel: UILabel!
  @IBOutlet weak var subscribedLabel: UILabel!
  @IBOutlet weak var channelName: UILabel!
  @IBOutlet weak var channelProfileImg: UIImageView!
  override func awakeFromNib() {
        super.awakeFromNib()
    
    bellImage.image = UIImage(named: "bell")?.withRenderingMode(.alwaysTemplate)
    bellImage.tintColor = UIColor(named: "grayColor")
    channelProfileImg.layer.cornerRadius = 51/2
    }

  func configCell(model:ChannelModel.Items){
    channelName.text = model.snippet.title
    infoLabel.text = model.snippet.description
    subscriptorsLabel.text = "\(model.statistics?.subscriberCount ?? "0") subscribers · \(model.statistics?.videoCount ?? "0") videos"
  }
    
}
