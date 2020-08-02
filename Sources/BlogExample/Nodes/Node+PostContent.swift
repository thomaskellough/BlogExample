//
//  File.swift
//  
//
//  Created by Thomas Kellough on 8/2/20.
//

import Foundation
import Publish
import Plot

extension Node where Context == HTML.BodyContext {
    static func postContent<T: Website>(for items: [Item<T>], on site: T) -> Node {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        
        let sortedItems = items.sorted {
            $0.date < $1.date
        }
        
        return
            .wrapper(
                // Create an unordered list
                .ul(
                    // Loop over each blog post that we have in our code
                    .class("item-list"),
                    .forEach(
                        sortedItems
                    ) { item in
                        // Creates a list item for each post
                        .li (
                            // Creates an article node to display our information
                            .article(
                                // Creates a heading with our post title
                                
                                .h1(
                                    // Creates an anchor tag so we can create the link to our post
                                    .a(
                                        // Creates the link to our post so we can click it and read everything
                                        .href(item.path),
                                        .text(item.title)
                                    )
                                ),
                                .tagList(for: item.tags, on: site),
                                // Creates a description  of what our post is about
                                .p(.text(item.description)),
                                .p(.text("Published: \(formatter.string(from: item.lastModified))"))
                            )
                        )
                    }
                )
        )
    }
}

