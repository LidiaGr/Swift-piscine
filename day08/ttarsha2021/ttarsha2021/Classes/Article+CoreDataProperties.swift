//
//  Article+CoreDataProperties.swift
//  ttarsha2021
//
//  Created by Lidia Grigoreva on 02.07.2021.
//
//

import Foundation
import CoreData


extension Article {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }
    
    @NSManaged public var title: String?
    @NSManaged public var content: String?
    @NSManaged public var language: String?
    @NSManaged public var image: Data?
    @NSManaged public var created_at: Date?
    @NSManaged public var modified_at: Date?
    
    override public var description: String {
        return "Title: \(title!)\nContent:\(content!)\nLanguage:\(language!)\nCreated at:\(created_at!)\nModified at: \(updated_at!)\n"
    }
}
