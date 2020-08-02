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
                .myHeader(for: context),
                .postsBy(author: "Albus Dumbledore", section: section, on: context.site),
                .postsBy(author: "Hermione Granger", section: section, on: context.site),
                .myFooter(for: context.site)
            )
        )
    }
}
