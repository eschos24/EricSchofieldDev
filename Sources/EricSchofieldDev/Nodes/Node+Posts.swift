//
//  Node+Posts.swift
//  
//
//  Created by Eric Schofield on 8/22/22.
//

import Plot
import Publish

extension Node where Context == HTML.BodyContext {

    static func posts(for items: [Item<PortfolioSite>], on site: PortfolioSite, title: String) -> Node {
        .pageContent(
            .div(
                .class("posts"),
                .h1(
                    .class("content-subhead"),
                    .text(title)
                ),
                .forEach(items, { item in
                        .postExcerpt(for: item, on: site)
                })
            )
        )
    }
}
