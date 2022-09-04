//
//  Node+PostExcerpt.swift
//  
//
//  Created by Eric Schofield on 8/22/22.
//

import Foundation
import Plot
import Publish

extension Node where Context == HTML.BodyContext {

    static func postExcerpt(for item: Item<PortfolioSite>, on site: PortfolioSite) -> Node {
        .section(
            .class("post"),
            .header(
                .class("post-header"),
                .h2(
                    .class("post-title"),
                    .a(
                        .href(item.path),
                        .text(item.title)
                    )
                ),
                .p(
                    .class("post-meta"),
                    .text(dateFormatter.string(from: item.date)),
                    tagList(for: item, on: site)
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
