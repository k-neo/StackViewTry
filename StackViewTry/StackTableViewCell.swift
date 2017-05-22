//
//  StackTableViewCell.swift
//  StackViewTry
//
//  Created by 秋本大介 on 2017/05/20.
//  Copyright © 2017年 秋本大介. All rights reserved.
//

import UIKit

class StackTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var descriptionTextLabel: UILabel!
    @IBOutlet weak var rightStackView: UIStackView!
    
    var setImage : UIImage!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        // ここでレイアウト変更、描画しても誤った初期表示されてしまうので処理は記述しない
    }

    // デバイスの横幅に合わせたサイズでイメージを設定
    // dataSource の処理中に自分でデバイスの幅が取得できないのでControllerからテーブルの横幅を受渡してもらう
    func setImageWithWidth(width: CGFloat, image: UIImage) {
        let rightStackViewWidth = width - titleLabel.frame.width - 20   // テーブルの横幅から左のラベルとマージンを引いて画像サイズを計算
        let imageDisplayHeight = image.size.height * rightStackViewWidth / image.size.width // 画像の比率と横幅から高さを計算
        
        let resizedSize = CGSize(width: rightStackViewWidth, height: imageDisplayHeight)
        UIGraphicsBeginImageContext(resizedSize)
        image.draw(in: CGRect(x: 0, y: 0, width: resizedSize.width, height: resizedSize.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        photoImageView.image = resizedImage
    }
}
