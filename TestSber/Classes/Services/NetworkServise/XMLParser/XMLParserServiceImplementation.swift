//
//  XMLParserServiceImplementation.swift
//  TestSber
//
//  Created by Viacheslav Loie on 27.04.2020.
//  Copyright © 2020 SberTestViper. All rights reserved.
//

import Foundation

class XMLParserServiceImplementation: NSObject, XMLParserDelegate, XMLParserService {
	
	//MARK: - private
    private var rssItems: [RSSItem] = []
    private var currentElement = ""
    private var currentTitle: String = "" {
        didSet {
			currentTitle = currentTitle.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentDescription: String = "" {
        didSet {
            currentDescription = currentDescription.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
    private var currentPubDate: String = "" {
        didSet {
            currentPubDate = currentPubDate.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
    }
	
    private var parserCompletionHandler: ItemClosure<[RSSItem]>?
	
	//MARK: - parseFeed
	func parseFeed(url: String, completionHandler:  @escaping ItemClosure<[RSSItem]>){
		 self.parserCompletionHandler = completionHandler

			   let request = URLRequest(url: URL(string: url)!)
			   let urlSession = URLSession.shared
			   let task = urlSession.dataTask(with: request) { (data, response, error) in
				   guard let data = data else {
					   if let error = error {
						   print(error.localizedDescription)
					   }
					   return
				   }
				   
				   /// parse our xml data
				   let parser = XMLParser(data: data)
				   parser.delegate = self
				   parser.parse()
			   }
			   
			   task.resume()
	}
    
    // MARK: - XML Parser Delegate
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        if currentElement == "item" {
            currentTitle = ""
            currentDescription = ""
            currentPubDate = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentElement {
        case "title": currentTitle += string
        case "description" : currentDescription += string
        case "pubDate" : currentPubDate += string
        default: break
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            let rssItem = RSSItem(title: currentTitle, descriptions: currentDescription, pubDate: currentPubDate)
            self.rssItems.append(rssItem)
        }
    }

    func parserDidEndDocument(_ parser: XMLParser) {
		parserCompletionHandler?(rssItems)
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print(parseError.localizedDescription)
    }
    
}


















