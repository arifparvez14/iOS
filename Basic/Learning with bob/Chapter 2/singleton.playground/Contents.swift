import UIKit

//SingleTon: A Singleton is an object which is instantiated exactly onec.

class AccountManager{
    static let shareInstnce = AccountManager()
    var userInfo = (ID: "Arif", password: 1234)
    func network(){}
    private init(){
        print("Im created")
    }
}
AccountManager.shareInstnce.userInfo
AccountManager.shareInstnce.userInfo.ID = "Arif"

