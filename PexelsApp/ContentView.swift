//
//  ContentView.swift
//  PexelsApp
//
//  Created by Raziel on 5/8/20.
//  Copyright © 2020 Raziel. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var photos = [Photo]()
    
    var body: some View {
        List(photos) { photo in
            VStack {
                ImageView(withURL: photo.src.landscape, width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height / 5, type: 1)
                HStack {
                    Text("By: ")
                    Text(photo.photographer).font(.headline)
                }
            }
        }.onAppear(perform: getPhotos)
    }
    
    func getPhotos() {
        let api_key = Config.api_key

        let url = URL(string: "https://api.pexels.com/v1/curated?per_page=15&page=1")!
        let request = URLSessionConfiguration.default
        request.httpAdditionalHeaders = [ AnyHashable("Authorization"): api_key]
	
        let session = URLSession(configuration: request)
        
        session.dataTask(with: url) { (data, response, error) in
            //print(String(decoding: data!, as: UTF8.self))
            do {
                let photos = try JSONDecoder().decode(Photos.self, from: data!)
                DispatchQueue.main.async {
                    self.photos = photos.photos
                }
            } catch {
                print(error)
            }
        }.resume()
    }
}
