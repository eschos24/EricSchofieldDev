//
//  Node+Post.swift
//  
//
//  Created by Eric Schofield on 8/23/22.
//

import Foundation
import Plot
import Publish

extension Node where Context == HTML.BodyContext {

    static func post(for item: Item<PortfolioSite>, on site: PortfolioSite) -> Node {
        .pageContent(
            .h2(
                .class("post-title"),
                .a(
                    .href(item.path),
                    .text(item.title)
                )
            ),
            .p(
                .class("post-meta"),
                .text(dateFormatter.string(from: item.date))
            ),
            .tagList(for: item.tags, on: site),
            .div(
                .class("post-description"),
                .div(
                    .contentBody(item.body)
                )
            )
        )
    }

    private static var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        return dateFormatter
    }
}
