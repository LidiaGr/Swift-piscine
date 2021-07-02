//
//  ViewController.swift
//  ttarsha2021
//
//  Created by LidiaGr on 07/02/2021.
//  Copyright (c) 2021 LidiaGr. All rights reserved.
//

import UIKit
import ttarsha2021

class ViewController: UIViewController {
    
    let articleManager = ArticleManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.\
        
        print("Article count before: \(articleManager.getAllArticles().count)")
        
        let article1 = articleManager.newArticle()
        article1.title = "Article 1"
        article1.language = "english"
        article1.content = "This is the first article with cat"

        let article2 = articleManager.newArticle()
        article2.title = "Article 2"
        article2.language = "russian"
        article2.content = "This is the first article with dog"

        let article3 = articleManager.newArticle()
        article3.title = "Article 3"
        article3.language = "english"

        let article4 = articleManager.newArticle()
        article4.title = "Article 4"

        print("Article count after: \(articleManager.getAllArticles().count)")
        articleManager.removeArticle(article: article4)
        print("Articles count after removing one: \(articleManager.getAllArticles().count)")
        print("All articles in english: \(articleManager.getArticles(withLang: "english").description)")
        print("All articles containig word 'first': \(articleManager.getArticles(containString: "first").count)")
        
        articleManager.save()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

