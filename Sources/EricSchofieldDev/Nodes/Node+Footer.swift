//
//  Node+Footer.swift
//  
//
//  Created by Eric Schofield on 8/22/22.
//

import Foundation
import Plot
import Publish

extension Node where Context == HTML.BodyContext {

    static func footer(for site: PortfolioSite) -> Node {
        let currentYear = Calendar.current.component(.year, from: .now)

        return .div(
            .class("footer pure-u-1"),
            .div(
                .class("pure-u-1"),
                .text("© \(currentYear) \(site.name)")
            ),
            .div(
                .class("pure-u-1"),
                .text("Generated using "),
                .a(
                    .href("https://github.com/johnsundell/publish"),
                    .text("Publish")
                )
            ),
            .div(
                .class("pure-u-1"),
                .a(
                    .href("/feed.rss"),
                    .text("RSS Feed")
                )
            )
        )
    }

    static func footer(for page: Page, on site: PortfolioSite) -> Node {
        if page.path == "/wordit/index" {
            let currentYear = Calendar.current.component(.year, from: .now)

            // Show privacy policy
            return .div(
                .class("footer pure-u-1"),
                .div(
                    .class("pure-u-1"),
                    .text("© \(currentYear) \(site.name)")
                ),
                .div(
                    .class("pure-u-1"),
                    .text("Generated using "),
                    .a(
                        .href("https://github.com/johnsundell/publish"),
                        .text("Publish")
                    )
                ),
                .div(
                    .class("pure-u-1"),
                    .a(
                        .href("/feed.rss"),
                        .text("RSS Feed")
                    )
                ),
                .div(
                    .class("pure-u-1"),
                    .a(
                        .href("/wordit/privacy-policy"),
                        .text("Privacy Policy")
                    )
                )
            )
        } else {
            return footer(for: site)
        }
    }
}
