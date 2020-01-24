import UIKit

//After Completion handler

class Firebase {
    func createUser(userName: String, password: String, completion: (Bool, Int) -> Void) {
        var isSuccess = true
        var userID = 123
        
        completion(isSuccess, userID)
    }
}

class MyApp {
    
    func registerButtonTapped() {
        
        let firebase = Firebase()
        
        firebase.createUser(userName: "Arif", password: "123"){
            (isSuccess: Bool, userID: Int) in
            print("registration is successful: \(isSuccess)")
            print("userID is: \(userID)")
        }
    }
}

let myApp = MyApp()
myApp.registerButtonTapped()

//Before completion Handler

/*
 class Firebase {
    func createUser(userName: String, password: String, completion: (Bool, Int) -> Void) {
        var isSuccess = true
        var userID = 123
        
        completion(isSuccess, userID)
    }
}

class MyApp {
    
    func registerButtonTapped() {
        
        let firebase = Firebase()
        
        firebase.createUser(userName: "Arif", password: "123", completion: completed)
    }
    
    func completed(isSuccess: Bool, userID: Int) {
        print("registration is successful: \(isSuccess)")
        print("userID is: \(userID)")
    }
}

let myApp = MyApp()
myApp.registerButtonTapped()
 */


