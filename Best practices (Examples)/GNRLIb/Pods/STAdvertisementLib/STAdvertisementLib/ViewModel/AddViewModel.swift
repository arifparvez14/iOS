//
//  AddViewModel.swift
//  STAdvertisementLib
//
//  Created by Sharetrip-iOS on 25/05/2021.
//

import Foundation

class AddViewModel {
    private let service: AddService
    private var addData: AddData?
    typealias CompletionCallBack = (_ success: Bool,_ error: String?) -> Void
    
    let htmlString = """
        <DOCTYPE HTML>
            <html>
                <head>
                    <meta charset='UTF-8'>
                    <meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'>
                    <style> body {margin: 0px; padding: 0px; height: 100%; width:100%;} img {margin: 0px; padding: 0px; height: 100%; width:100%;} </style>
                </head>
            <body>
                <script>
                    document.addEventListener('DOMContentLoaded', function(event) {
                        var title = 'Sharetrip.com is offering 40% discount';
                        var link = 'www.sharetrip.com';
                        var imageSrc = 'https://gnr-dev-ads-storage.s3.ap-southeast-1.amazonaws.com/dev/ads/1018391e-7e88-3267-b8a8-c9ad4747baaa.gif';
                        var apiEndPoint = 'http://localhost:3000/ad/interaction';
                        var payload = {
                            placeId: '6b2207eb-4e1b-386a-8ca3-6e29d4f39fc7',
                            propertyId: '0e3d70b9-c527-36c1-9594-242e7b6f68c0',
                            cookie: '83LSI-IL388-FFX70-XX158',
                            requestId: 'ffd42aaf-e0ac-3146-93b8-23f6321263cd|b1c7b125-a6f0-31a1-80e6-25cd08f20bfc|1018391e-7e88-3267-b8a8-c9ad4747baaa',
                            date: '2021-05-24T06:48:49.824Z',
                            actionType: ''
                        };
                        var imageNode = document.createElement('img');
                        imageNode.src = imageSrc;
                        imageNode.alt = title;
                        imageNode.style.width = '50%';
                        var linkNode = document.createElement('a');
                        linkNode.href = link;
                        linkNode.target = '_blank';
                        linkNode.appendChild(imageNode);
                        var wrapper = document.createElement('div');
                        wrapper.className = 'adv-area-wrapper';
                        wrapper.appendChild(linkNode);
                        var x = document.getElementsByTagName('BODY')[0];
                        x.appendChild(wrapper);
                        x.onclick = function() {
                            var xhr = new XMLHttpRequest();
                            xhr.withCredentials = true;
                            xhr.open('POST', apiEndPoint);
                            xhr.setRequestHeader('Content-Type', 'application/json');
                            xhr.setRequestHeader('Access-Control-Allow-Origin', '*');
                            payload.actionType = "click";
                            xhr.send(JSON.stringify(payload));
                            xhr.addEventListener('readystatechange', function() {
                                if (this.readyState === 4) {
                                    const {
                                        response,
                                        status
                                    } = this;
                                    console.log({
                                        response,
                                        status
                                    });
                                    if (status === 201) {
                                        return response;
                                    }
                                    return false;
                                }
                            });
                        };
                    });
                </script>
            </body>
            </html>
    """
    
    init(service: AddService){
        self.service = service
    }
    
    func loadData(onCompletion: @escaping CompletionCallBack) {
        service.fetchAddData { (res) in
            switch res {
            case .success(let addData):
                self.addData = addData
                onCompletion(true, nil)
            case .failure(let err):
                print("Failure error", err)
                onCompletion(false, err.localizedDescription)
            }
        }
    }
    
    func getHTMLString() -> String {
        let script =  addData?.script ?? ""
        let style = "body {margin: 0px; padding: 0px; height: 100%; width:100%;} img {margin: 0px; padding: 0px; height: 100%; width:100%;}"
        let htmlString = Utils.generateHTML(content: script, style: style)
        return self.htmlString
    }
    
}
