//
//  Theme+PortfolioTheme.swift
//  
//
//  Created by Eric Schofield on 8/22/22.
//

import Foundation
import Plot
import Publish

// This type acts as the configuration for your website.
struct PortfolioSite: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case posts
        case apps
        case about
//        case contact
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://ericschofield.dev")!
//    var title = "Eric Schofield"
    var name = "Eric Schofield"
    var description = "Developer website"
    var language: Language { .usEnglish }
    var imagePath: Path? { nil }
    var contactLinks: [ContactLink] = [
        .myLocation,
        .twitter,
        .linkedIn,
        .gitHub,
        .email
    ]
}
