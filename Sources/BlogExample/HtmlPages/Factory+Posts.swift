//
//  File.swift
//  
//
//  Created by Thomas Kellough on 8/2/20.
//

import Publish
import Plot

extension MyHTMLFactory {
    func makePostsHTML(for section: Section<Site>, context: PublishingContext<Site>) throws -> HTML {
         HTML(
            .head(for: context.index, on: context.site),
            .body(
                // Create an unordered list
                .ul(
                    // Loop over each blog post that we have in our code
                    .class("item-list"),
                    .forEach(
                        section.items
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
                                // Creates a description  of what our post is about
                                .p(.text(item.description))
                            )
                        )
                    }
                )
            )
        )
    }
}
