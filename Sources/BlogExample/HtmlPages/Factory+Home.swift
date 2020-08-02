//
//  File.swift
//  
//
//  Created by Thomas Kellough on 8/2/20.
//

import Publish
import Plot

extension MyHTMLFactory {
    func makeHomeHTML<T: Website>(for index: Index, section: Section<T>, context: PublishingContext<T>) throws -> HTML {
        
        var homeImage: Path { "Images/swift-logo.png" }
        
        return
            HTML(
                .head(for: index, on: context.site),
                .body(
                    .myHeader(for: context),
                    .class("logo-image"),
                    .img(.src(homeImage)),
                    .myFooter(for: context.site)
                )
        )
    }
}
