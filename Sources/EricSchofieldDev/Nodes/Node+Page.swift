//
//  Node+Page.swift
//  
//
//  Created by Eric Schofield on 8/23/22.
//

import Plot
import Publish

extension Node where Context == HTML.BodyContext {

    static func page(for page: Page, on site: PortfolioSite) -> Node {
        .pageContent(
            .h2(
                .class("post-title"),
                .text(page.title)
            ),
            .div(
                .class("post-description"),
                .div(
                    .contentBody(page.body)
                )
            )
        )
    }
}
