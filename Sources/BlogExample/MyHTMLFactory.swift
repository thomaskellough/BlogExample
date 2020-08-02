//
//  File.swift
//  
//
//  Created by Thomas Kellough on 8/2/20.
//

import Publish
import Plot

struct MyHTMLFactory: HTMLFactory {
    func makeIndexHTML(for index: Index, context: PublishingContext<BlogExample>) throws -> HTML {
        let sections = context.sections
        let section = sections.first(where: { $0.id.rawValue == "home" })!
        
        return try makeHomeHTML(for: index, section: section, context: context)
    }

    func makeSectionHTML(for section: Section<BlogExample>, context: PublishingContext<BlogExample>) throws -> HTML {
        switch section.id.rawValue {
        case "posts":
            return try makePostsHTML(for: section, context: context)
        case "home":
            return try makeHomeHTML(for: context.index, section: section, context: context)
        case "about":
            return HTML(.text("Hello about!"))
        default:
            return try makePostsHTML(for: section, context: context)
        }
    }

    func makeItemHTML(for item: Item<BlogExample>, context: PublishingContext<BlogExample>) throws -> HTML {
        HTML(
            .head(for: item, on: context.site),
            .body(
                .myHeader(for: context),
                .wrapper(
                    .article(
                        .contentBody(item.body)
                    )
                ),
                .myFooter(for: context.site)
            )
        )
    }

    func makePageHTML(for page: Page, context: PublishingContext<BlogExample>) throws -> HTML {
        HTML(.text("Hello, page"))
    }

    func makeTagListHTML(for page: TagListPage, context: PublishingContext<BlogExample>) throws -> HTML? {
        HTML(.text("Hello, tag list"))
    }

    func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<BlogExample>) throws -> HTML? {
        HTML(
            .head(for: context.index, on: context.site),
            .body(
                .myHeader(for: context),
                .h1(
                    .text("All posts with the tag \(page.tag.string)")
                ),
                .postContent(for: context.items(taggedWith: page.tag), on: context.site),
                .myFooter(for: context.site)
            )
        )
    }
}
