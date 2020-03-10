import UIKit
var str = "Hello, Completion handler"

//: Practical UIKit Example

let firstVC = UIViewController()
let nextVC = UIViewController()

firstVC.present(nextVC, animated: true, completion: nil)
firstVC.present(nextVC, animated: true, completion: {
    () in
    print("Done")
})
firstVC.present(nextVC, animated: true) {
    print("Third Way")
}

//:: Design Handler Block
let myHandlerBlock: (Bool) -> () = {(isSuccess) in
    if isSuccess {
        print("Download done")
    }
}
myHandlerBlock(true)

let handlerBlock: (Bool) -> () = {
    if $0 {
        print("Download has been done")
    }
}
handlerBlock(true)

//Design a method like present
func downloadAnImage(completionBlock: (Bool) -> Void) {
    for _ in 1...100 {
        print("Downloading")
    }
    completionBlock(true)
}
//Pass closure Indirectly
downloadAnImage(completionBlock: handlerBlock)

//Pass closure directly
downloadAnImage { (isSuccess) in
    if isSuccess {
        print("Done")
    }
}

//Another Example: get data
let handler: ([String]) -> Void = { (array) in
    print("Done working, \(array)")
    //compress the image
    //add color
    //resize
}


func workSuperHard(doneStuff: ([String]) -> Void) {
    for _ in 1...100{
        print("But you gotta put in ...")
        //download
    }
    doneStuff(["img1","img2", "img3"])
}

//: Enter closure indirectly
workSuperHard(doneStuff: handler)

//: Enter closure indirectly
workSuperHard { (images: [String]) in
    print("Done working, \(images)")
    //compress the image
    //add color
    //resize
}

