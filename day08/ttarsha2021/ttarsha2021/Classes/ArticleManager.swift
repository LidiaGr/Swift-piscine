//
//  ArticleManager.swift
//  ttarsha2021
//
//  Created by Lidia Grigoreva on 02.07.2021.
//

import CoreData

public class ArticleManager {
    
    var managedObjectContext: NSManagedObjectContext
    
    public init() {
        let momdName = "Article"

        let myBundle = Bundle(identifier: "org.cocoapods.ttarsha2021")
        guard let modelURL = myBundle?.url(forResource: momdName, withExtension:"momd") else {
            fatalError("Error loading model from bundle")
        }

        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }

        let container = NSPersistentContainer(name: "Articles", managedObjectModel: mom)
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        managedObjectContext = container.viewContext
    }
    
    func fetchArticles(predicate: NSPredicate?) -> [Article] {
        var articles = [Article]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
        if predicate != nil {
            request.predicate = predicate
        }
        do {
            articles = try managedObjectContext.fetch(request) as! [Article]
        } catch let error as NSError {
            print ("Error \(error.localizedDescription)")
        }
        return articles
    }
    
    public func newArticle() -> Article {
        return NSEntityDescription.insertNewObject(forEntityName: "Article", into: managedObjectContext) as! Article
    }
    
    public func getAllArticles() -> [Article] {
        return fetchArticles(predicate: nil)
    }
    
    public func getArticles(withLang lang: String) -> [Article] {
        return fetchArticles(predicate: NSPredicate(format: "language == %@", lang))
    }
    
    public func getArticles(containString str: String) -> [Article] {
        return fetchArticles(predicate: NSPredicate(format: "content CONTAINS %@ || title CONTAINS %@", str.lowercased(), str.lowercased()))
    }
    
    public func removeArticle(article : Article) {
        managedObjectContext.delete(article)
    }
    
    public func save() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch let error {
                managedObjectContext.rollback()
                print ("Error \(error.localizedDescription)")
            }
        }
    }
    
}

