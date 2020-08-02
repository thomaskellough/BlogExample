import Foundation
import Publish
import Plot

// This type acts as the configuration for your website.
struct BlogExample: Website {
    enum SectionID: String, WebsiteSectionID, CaseIterable {
        // Add the sections that you want your website to contain here:
        case home
        case posts
        case about
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://your-website-url.com")!
    var name = "BlogExample"
    var description = "A description of BlogExample"
    var language: Language { .english }
    var imagePath: Path? { nil }
}

extension Theme where Site == BlogExample {
    static var myTheme: Theme {
        Theme(htmlFactory: MyHTMLFactory(), resourcePaths: ["Resources/MyTheme/styles.css"])
    }
}

// This will generate your website using the built-in Foundation theme:
try BlogExample().publish(withTheme: .myTheme)
