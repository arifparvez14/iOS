//
//  ViewController.swift
//  JSONParseLBTASwift5
//
//  Created by Sharetrip-iOS on 21/07/2020.
//  Copyright © 2020 AP. All rights reserved.
//

import UIKit

struct Courses: Decodable{
    let id: Int
    let name: String
    let link: String
    let imageUrl: String
    let number_of_lessons: Int
}

class ViewController: UIViewController {

    var dispatchGroup = DispatchGroup()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }

    fileprivate func loadData() {

        dispatchGroup.enter()
        fetchCoursesJSON { (res) in
            switch res {
                case .success(let courses):
                    courses.forEach ({ (course) in
                        print(course.name)
                    })
                case .failure(let err):
                    print("Failure error", err)
            }
            self.dispatchGroup.leave()
        }


        dispatchGroup.enter()
        fetchCoursesJSON { (res) in
            switch res {
                case .success(let courses):
                    courses.forEach ({ (course) in
                        print(course.name)
                    })
                case .failure(let err):
                    print("Failure error", err)
            }
            self.dispatchGroup.leave()
        }

        dispatchGroup.notify(queue: DispatchQueue.global()) {
            print("Task completed")
        }
    }

    fileprivate func fetchCoursesJSON(completion: @escaping (Result<[Courses], Error>) -> ()) {
        let urlString = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        guard let url = URL(string: urlString) else {return}

        URLSession.shared.dataTask(with: url) { (data, res, err) in

            if let err = err {
                completion(.failure(err))
                return
            }

            do{
                let courses = try JSONDecoder().decode([Courses].self, from: data!)
                completion(.success(courses))
            } catch let jsonError {
                completion(.failure(jsonError))
            }

        }.resume()
    }
}

