//
//  MKDownloader.swift
//  DemoApp
//
//  Created by Panupong Chaiyarut on 9/1/2565 BE.
//

import UIKit

class MKImageDownloader: NSObject {

    func downloadAndCacheImage(url:String, onSuccess:@escaping (_ image:UIImage?, _ url: String) -> Void, onFailure:@escaping (_ error:Error?) -> Void) -> Void {
        
        let finalUrl = URL(string: url )
        
        if let image = MKImageDownloadManager.sharedInstance.getImage(forUrl: url){
            onSuccess(image, url)
        }else{
            URLSession.shared.dataTask(with: finalUrl!, completionHandler: { (data, response, error) in
                
                if error != nil {
                    print(error!)
                    onFailure(error)
                }else{
                    if let image = UIImage(data: data!){
                        MKImageDownloadManager.sharedInstance.setImage(image: image, forKey: url)
                        onSuccess(image, url)
                    }else{
                        onFailure(NSError(domain: "", code: 100, userInfo: ["reason":"Unable to download image"]))
                    }

                }
                
            }).resume()
        }
       
    }
    
  
    
}
