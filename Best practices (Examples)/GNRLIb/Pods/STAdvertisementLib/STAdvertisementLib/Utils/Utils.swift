//
//  Utils.swift
//  STAdvertisementLib
//
//  Created by Sharetrip-iOS on 25/05/2021.
//

import Foundation

class Utils {
    static func generateHTML(content: String, style: String) -> String {
        let htmlStr = """
            <DOCTYPE HTML>
                <html lang='en'>
                    <head>
                        <meta charset='UTF-8'>
                        <meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'>
                        <style> \(style) </style>
                    </head>
                    <body>
                        <script> \(content) </script>
                    </body>
                </html>
        """
        return htmlStr
    }
}
