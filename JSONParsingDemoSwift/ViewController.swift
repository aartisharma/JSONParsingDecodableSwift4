//
//  ViewController.swift
//  JSONParsingDemoSwift
//
//  Created by Aarati Sharma on 7/25/17.
//  Copyright © 2017 synerzip. All rights reserved.
//


// API used
//http://api.letsbuildthatapp.com/appstore/featured
//http://api.letsbuildthatapp.com/jsondecodable/course
//http://api.letsbuildthatapp.com/jsondecodable/courses
//https://api.letsbuildthatapp.com/jsondecodable/website_description

import UIKit
struct WebsiteDescription : Decodable {
    let name: String
    let description: String
    let courses: [Course]
}

struct Course : Decodable {
    let id: Int
    let name: String
    let link: String
    let imageUrl: String
    
    //Parsing in swift 2 and swift 3
    
    /*init(json: [String: Any]) {
        
    id = json["id"] as? Int ?? -1
    name = json["name"] as? String ?? ""
        link = json["link"] as? String ?? ""
        imageUrl = json["imageUrl"] as? String ?? ""
    }
 */
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //let myCourse = Course(id: 1, name: "Aari", link: "linkUrl", imageUrl: "imageUrl")
       // print(myCourse)
        
        let urlString = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
           // print("inside parser data is \(data) and response is \(response) and srror is \(err) ")
            guard let data = data else { return }
            
            // Old ways in swift 2 and swift 3 to parse json
            
            //let dataAsString = String(data: data, encoding: .utf8)
            //print(dataAsString!)
            
            do{
                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
                print(websiteDescription.courses)
                print(websiteDescription.name)
                print(websiteDescription.description)
                
                //get data from Array json
                //let courses = try JSONDecoder().decode([Course].self , from: data)
                //print(courses[0].name)
                //print(courses[1].name)
                
                
                
                // Parsing in swift 2 and swift 3
                 
               /*  guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as?[String: Any] else
                {
                 return
                }
                let course = Course(json: json)
                print(course.name)
                print(course.link)
                print(course.imageUrl)
                print(course.id)
                */
                
            }
            catch let jsonErr{
                print(jsonErr)
            }
            
            
            
            
        }.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

