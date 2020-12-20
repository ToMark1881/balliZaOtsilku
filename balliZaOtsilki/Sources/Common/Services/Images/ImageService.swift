//
//  ImageService.swift
//  SuperDealNew
//
//  Created by Pokupon & SuperDeal Mobile Team on 12/19/16.
//  Copyright © 2016 SuperDeal Limited Liability Company. All rights reserved.
//

import Foundation
import SDWebImage


class ImageService {
    
    var enableActivityIndicator: Bool = true
    
    static let shared = ImageService()
    
    private init() { }
    
    class func getDocumentDirectoryPath() -> NSString {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory as NSString
    }
    
    class func saveImageToDocumentsDirectory(image: UIImage, withName: String) -> String? {
        if let data = image.pngData() {
            let dirPath = getDocumentDirectoryPath()
            let imageFileUrl = URL(fileURLWithPath: dirPath.appendingPathComponent(withName) as String)
            do {
                try data.write(to: imageFileUrl)
                
                return imageFileUrl.absoluteString
            } catch {
                Logger.shared.log(error)
            }
        }
        return nil
    }
    
    class func loadImageFromDocumentsDirectory(imageName: String) -> UIImage? {
        let tempDirPath = getDocumentDirectoryPath()
        let imageFilePath = tempDirPath.appendingPathComponent(imageName)
        return UIImage(contentsOfFile:imageFilePath)
    }
    
    func loadInto(_ imageView: UIImageView?, url: URL?, placeholderImage: UIImage? = nil, showActivityIndicator: Bool = true, completion: ((UIImage?) -> Void)? = nil) {
        guard let url = url, let imageView = imageView  else {
            return
        }
        
        if showActivityIndicator {
            imageView.sd_imageIndicator = SDWebImageActivityIndicator.white
        }
        
        imageView.sd_setImage(with: url, placeholderImage: placeholderImage) { (image, error, cacheType, url) in
            if error != nil {
                Logger.shared.log(error)
            }
            
            completion?(image)
        }
    }
    
    func loadImage(_ picture: Picture?, completion: @escaping ((UIImage?) -> Void)) {
        guard let url = picture?.url else { return }
        DispatchQueue.global(qos: .userInitiated).async {
            SDWebImageManager.shared.loadImage(with: url, options: [], progress: nil) { (image, data, error, _, _, _) in
                completion(image)
            }
        }
    }
    
    func loadInto(_ imageView: UIImageView?, picture: Picture?, placeholderImage: UIImage? = nil, showActivityIndicator: Bool = true, completion: ((UIImage?) -> Void)? = nil) {
        guard let url = picture?.url, let imageView = imageView  else {
            return
        }
        
        if showActivityIndicator {
            imageView.sd_imageIndicator = SDWebImageActivityIndicator.white
        }
        
        imageView.sd_setImage(with: url, placeholderImage: placeholderImage) { (image, error, cacheType, url) in
            if error != nil {
                Logger.shared.log(error)
            }
            
            completion?(image)
        }
    }

    func prefetchURLs(_ urls: [URL]) {
        SDWebImagePrefetcher.shared.prefetchURLs(urls)
    }

    func imageURL(_ picture: Picture?) -> URL? {
        return prepareUrl(picture: picture)
    }
    
    fileprivate func prepareUrl(picture: Picture? = nil) -> URL? {
        return picture?.url
    }
}
