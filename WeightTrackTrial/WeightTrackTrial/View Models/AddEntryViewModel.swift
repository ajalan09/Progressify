//
//  AddEntryViewModel.swift
//  WeightTrackTrial
//
//  Created by Aman Jalan on 5/6/20.
//  Copyright © 2020 Aman Jalan. All rights reserved.
//

import Foundation
import SwiftUI

class AddEntryViewModel {

    var date: Date = Date()
    var weight: String = ""
    var frontImg: UIImage = (UIImage(systemName: "person")?.imageWithColor(color1: UIColor.white))!
    var sideImg: UIImage = (UIImage(systemName: "person")?.imageWithColor(color1: UIColor.white))!
    var backImg: UIImage = (UIImage(systemName: "person")?.imageWithColor(color1: UIColor.white))!
    var id: UUID = UUID()

    func saveEntry () {
        CoreDataManager.shared.saveEntry(date: self.date, weight: self.weight, frontImg: self.frontImg, sideImg: self.sideImg, backImg: self.backImg, id: self.id)
    }
}

extension UIImage {
    func imageWithColor(color1: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        color1.setFill()

        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.setBlendMode(CGBlendMode.normal)

        let rect = CGRect(origin: .zero, size: CGSize(width: self.size.width, height: self.size.height))
        context?.clip(to: rect, mask: self.cgImage!)
        context?.fill(rect)

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
}
