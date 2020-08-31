//
//  ViewController.swift
//  JWTTry
//
//  Created by Sharetrip-iOS on 14/07/2020.
//  Copyright © 2020 AP. All rights reserved.
//

import UIKit
import JWTDecode
import ObjectMapper
import SwiftyJSON

//Object mapper class and struct

class Question: Mappable {
    var questionCode: String?
    var question: String?
    var image: String?
    var options: [Option]?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        questionCode  <- map["questionCode"]
        question <- map["question"]
        image <- map["image"]
        options <- map["options"]
    }
    
}

struct Option: Mappable {
    var answerCode: String?
    var answer: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        answerCode  <- map["answerCode"]
        answer <- map["answer"]
    }
    
}


// normal class ans struct

struct Options {
    var answerCode: String?
    var answer: String?
}

struct Questions {
    var questionCode: String?
    var question: String?
    var image: String?
    var options: [Options]?
}



class ViewController: UIViewController {
    
    var arrayList = [Questions]()

    var info = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjoiW3tcInF1ZXN0aW9uQ29kZVwiOlwiN2E3NWJmODJiYWVhMTFlYWJmZmNmYTVmYjk5YjkwNjRcIixcInF1ZXN0aW9uXCI6XCJJbiB3aGljaCBjb3VudHJ5IHlvdSBuZWVkIHRvIHZpc2l0IHRvIGV4cGxvcmUgUGV0cmE_IFwiLFwiaW1hZ2VcIjpcImh0dHBzOi8vdGJiZC1mbGlnaHQuczMuYXAtc291dGhlYXN0LTEuYW1hem9uYXdzLmNvbS9xdWl6L1VpaERaWHdvbWN1LWQydmlOc0w3VWlld1FZaXFxcFhKLnBuZ1wiLFwib3B0aW9uc1wiOlt7XCJhbnN3ZXJDb2RlXCI6XCI3YTc2NmFjY2JhZWExMWVhODMxN2ZhNWZiOTliOTA2NFwiLFwiYW5zd2VyXCI6XCJNYWxheXNpYSBcIn0se1wiYW5zd2VyQ29kZVwiOlwiN2E3NjZiOTRiYWVhMTFlYWFmOTVmYTVmYjk5YjkwNjRcIixcImFuc3dlclwiOlwiSm9yZGFuIFwifSx7XCJhbnN3ZXJDb2RlXCI6XCI3YTc2NmMwMmJhZWExMWVhOGIxMGZhNWZiOTliOTA2NFwiLFwiYW5zd2VyXCI6XCJWaWV0bmFtIFwifSx7XCJhbnN3ZXJDb2RlXCI6XCI3YTc2NmM2NmJhZWExMWVhYTkyMGZhNWZiOTliOTA2NFwiLFwiYW5zd2VyXCI6XCJBdXN0cmFsaWEgXCJ9XX0se1wicXVlc3Rpb25Db2RlXCI6XCI4YjAyYmZmOGJhZWExMWVhOTg4MmZhNWZiOTliOTA2NFwiLFwicXVlc3Rpb25cIjpcIldvcmxkcyBvbmUgb2YgdGhlIG1vc3QgbHV4YXJpb3VzIGhvdGVsIFxcXCJCdXJqIEFsIEFyYWJcXFwiICBpbiB3aGljaCBjb3VudHJ5P1wiLFwiaW1hZ2VcIjpcImh0dHBzOi8vdGJiZC1mbGlnaHQuczMuYXAtc291dGhlYXN0LTEuYW1hem9uYXdzLmNvbS9xdWl6L1FUS0t2cEp4aFdZN0RBLUc0YmhuT2RQb1EwMldzUjRvLnBuZ1wiLFwib3B0aW9uc1wiOlt7XCJhbnN3ZXJDb2RlXCI6XCI4YjAzNmNkMmJhZWExMWVhYWEwM2ZhNWZiOTliOTA2NFwiLFwiYW5zd2VyXCI6XCJGcmFuY2VcIn0se1wiYW5zd2VyQ29kZVwiOlwiOGIwMzZkOWFiYWVhMTFlYTgwODVmYTVmYjk5YjkwNjRcIixcImFuc3dlclwiOlwiRHViYWlcIn0se1wiYW5zd2VyQ29kZVwiOlwiOGIwMzZlMTJiYWVhMTFlYWJhZmVmYTVmYjk5YjkwNjRcIixcImFuc3dlclwiOlwiRW5nbGFuZFwifSx7XCJhbnN3ZXJDb2RlXCI6XCI4YjAzNmU4MGJhZWExMWVhYmYyMGZhNWZiOTliOTA2NFwiLFwiYW5zd2VyXCI6XCJDYW5hZGFcIn1dfSx7XCJxdWVzdGlvbkNvZGVcIjpcImFkMmIzZTY2YmFlYTExZWE5NzNlZmE1ZmI5OWI5MDY0XCIsXCJxdWVzdGlvblwiOlwiV2hpY2ggY291bnRyeSBoYXMgdGhlIHdvcmxkJ3MgaGlnaGVzdCB3YXRlcmZhbGw_XCIsXCJpbWFnZVwiOlwiaHR0cHM6Ly90YmJkLWZsaWdodC5zMy5hcC1zb3V0aGVhc3QtMS5hbWF6b25hd3MuY29tL3F1aXovMWNucUI1TGdVMzEyUWZPdkdtdGY3ZlJWc05OdkM0QVIucG5nXCIsXCJvcHRpb25zXCI6W3tcImFuc3dlckNvZGVcIjpcImFkMmJmNDNjYmFlYTExZWE4Yzk5ZmE1ZmI5OWI5MDY0XCIsXCJhbnN3ZXJcIjpcIlZlbmV6dWVsYVwifSx7XCJhbnN3ZXJDb2RlXCI6XCJhZDJiZjU3Y2JhZWExMWVhYjc2NGZhNWZiOTliOTA2NFwiLFwiYW5zd2VyXCI6XCJVU0FcIn0se1wiYW5zd2VyQ29kZVwiOlwiYWQyYmY2MjZiYWVhMTFlYWJmNGFmYTVmYjk5YjkwNjRcIixcImFuc3dlclwiOlwiSmFwYW5cIn0se1wiYW5zd2VyQ29kZVwiOlwiYWQyYmY2YjJiYWVhMTFlYWJkNTVmYTVmYjk5YjkwNjRcIixcImFuc3dlclwiOlwiVWdhbmRhXCJ9XX0se1wicXVlc3Rpb25Db2RlXCI6XCJjNmI1YjUwYWJhZWExMWVhYjNiZWZhNWZiOTliOTA2NFwiLFwicXVlc3Rpb25cIjpcIldoaWNoIFNvdXRoIEFtZXJpY2FuIGNvdW50cnkgaGFzIGxhbmQgYm9yZGVycyB3aXRoIHRlbiBvdGhlciBjb3VudHJpZXM_XCIsXCJpbWFnZVwiOlwiaHR0cHM6Ly90YmJkLWZsaWdodC5zMy5hcC1zb3V0aGVhc3QtMS5hbWF6b25hd3MuY29tL3F1aXovQ1BMUVhzSm9MZDRsUDFpT3FJcjg2SmxoZmc4Z3FkUnEucG5nXCIsXCJvcHRpb25zXCI6W3tcImFuc3dlckNvZGVcIjpcImM2YjY1ZjZlYmFlYTExZWE5ZjA5ZmE1ZmI5OWI5MDY0XCIsXCJhbnN3ZXJcIjpcIlBlcnVcIn0se1wiYW5zd2VyQ29kZVwiOlwiYzZiNjYwNDBiYWVhMTFlYTkwZThmYTVmYjk5YjkwNjRcIixcImFuc3dlclwiOlwiRWN1YWRvclwifSx7XCJhbnN3ZXJDb2RlXCI6XCJjNmI2NjBhZWJhZWExMWVhYmVlM2ZhNWZiOTliOTA2NFwiLFwiYW5zd2VyXCI6XCJCcmF6aWxcIn0se1wiYW5zd2VyQ29kZVwiOlwiYzZiNjYxMDhiYWVhMTFlYWJiYWFmYTVmYjk5YjkwNjRcIixcImFuc3dlclwiOlwiUGFyYWd1YXlcIn1dfSx7XCJxdWVzdGlvbkNvZGVcIjpcImQ5MDBiOGZlYmFlYTExZWFiMThjZmE1ZmI5OWI5MDY0XCIsXCJxdWVzdGlvblwiOlwiSWYgeW91IGZsaXAgdGhlIEluZG9uZXNpYW4gZmxhZywgd2hpY2ggRXVyb3BlYW4gQ291bnRyeeKAmXMgZmxhZyB3b3VsZCB5b3UgZ2V0P1wiLFwiaW1hZ2VcIjpcImh0dHBzOi8vdGJiZC1mbGlnaHQuczMuYXAtc291dGhlYXN0LTEuYW1hem9uYXdzLmNvbS9xdWl6L0xlQzlCbVhPb2xVTXUwcmhMOUlUZVRPd2dDMzVuN29FLnBuZ1wiLFwib3B0aW9uc1wiOlt7XCJhbnN3ZXJDb2RlXCI6XCJkOTAxNmY4OGJhZWExMWVhYmFiYWZhNWZiOTliOTA2NFwiLFwiYW5zd2VyXCI6XCJTaW5nYXBvcmVcIn0se1wiYW5zd2VyQ29kZVwiOlwiZDkwMTcwNmViYWVhMTFlYWI1NmVmYTVmYjk5YjkwNjRcIixcImFuc3dlclwiOlwiTGF0dmlhXCJ9LHtcImFuc3dlckNvZGVcIjpcImQ5MDE3MGRjYmFlYTExZWFhZDQxZmE1ZmI5OWI5MDY0XCIsXCJhbnN3ZXJcIjpcIlBvbGFuZFwifSx7XCJhbnN3ZXJDb2RlXCI6XCJkOTAxNzE0MGJhZWExMWVhYjk3Y2ZhNWZiOTliOTA2NFwiLFwiYW5zd2VyXCI6XCJQZXJ1XCJ9XX1dIiwiaWF0IjoxNTk0NjU1MDg4fQ.59kP9f3L-bVXWj2jockE117VKbTRTjteqw5hnVro0q4"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Decode and get data from decoded text

        let decoded = decoder(jwtToken: info)
        let decoderString = decoded["data"] as! String
        print(decoderString)


        if let list = self.convertToArrayOfDictionary(text: decoderString) as? [AnyObject] {
            mapUsingObjectMapper(list: list)
            accessJSONData(list: list)
        }
    }

    //Object mapper map

    func mapUsingObjectMapper(list: [AnyObject]){
        guard let questions = Mapper<Question>().mapArray(JSONObject: list) else{
            return
        }
        print("questions.count = \(questions.count)")
        print(questions[0].image ?? "")
        print(questions[0].options?[0].answer ??
            "")
        print(questions[0].question ?? "")
        print("see")
    }

    //access data from json

    func accessJSONData(list: [AnyObject]){
        let json = JSON(list)
        let jsonArray = json.arrayValue

        for item in jsonArray{
            let question = item["question"].stringValue
            let img = item["image"].stringValue
            let questionCode = item["questionCode"].stringValue

            let optionArr = item["options"].arrayValue

            var optionArray = [Options]()

            for option in optionArr{

                let answer = option["answer"].stringValue
                let answerCode = option["answerCode"].stringValue

                let option = Options(answerCode: answer, answer: answerCode)
                optionArray.append(option)

            }

            let model = Questions(questionCode: questionCode, question: question, image: img, options: optionArray)
            arrayList.append(model)
        }
    }

    //Convert array of object to dictionary --> NEED Alamofire, SwiftyJSON, yourkarma/JWT

    /*private func encodedText(answer: [Quiz.Answer]) -> String {

        var parameters = [Parameters]()
        for ans in answer{
            let parameter = [
                "questionCode" : ans.questionCode,
                "answerCode" : ans.answerCode
            ]
            parameters.append(parameter)
        }

        let json = JSON(parameters)
        let stringValue = convertJsonToString(json: json)

        let payload = [
            "data": "\(stringValue)"
        ]

        guard let encoded = JWTBuilder.encodePayload(payload)?.secret(encryptionKey)?.algorithm(algorithm)?.encode else {
            fatalError("No encoded text found")
        }
        return encoded
    }


    func convertJsonToString(json: JSON) -> String {
        do {
            let rawData = try json.rawData()
            let convertedString = String(data: rawData, encoding: String.Encoding.utf8)
            return convertedString ?? ""
        } catch {
            print("Error \(error)")
        }
        return ""

    }*/

    
    //Convert string to data then Anyobject array

    func convertToArrayOfDictionary(text: String) -> Any? {
        if let data = text.data(using: .utf8) {
            do {
                let jsonArray = try JSONSerialization.jsonObject(with: data, options: [])
                return jsonArray
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    //Decode functionality
    
    func decoder(jwtToken jwt: String) -> [String: Any] {
        let segments = jwt.components(separatedBy: ".")
        return decodeJWTPart(segments[1]) ?? [:]
    }
    
    func base64UrlDecode(_ value: String) -> Data? {
        var base64 = value
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")
        
        let length = Double(base64.lengthOfBytes(using: String.Encoding.utf8))
        let requiredLength = 4 * ceil(length / 4.0)
        let paddingLength = requiredLength - length
        if paddingLength > 0 {
            let padding = "".padding(toLength: Int(paddingLength), withPad: "=", startingAt: 0)
            base64 = base64 + padding
        }
        return Data(base64Encoded: base64, options: .ignoreUnknownCharacters)
    }
    
    func decodeJWTPart(_ value: String) -> [String: Any]? {
        guard let bodyData = base64UrlDecode(value),
            let json = try? JSONSerialization.jsonObject(with: bodyData, options: []), let payload = json as? [String: Any] else {
                return nil
        }
        
        return payload
    }
    
    
}

