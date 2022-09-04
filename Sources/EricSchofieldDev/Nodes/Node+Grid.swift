//
//  Node+Grid.swift
//  
//
//  Created by Eric Schofield on 8/22/22.
//

import Plot

extension Node where Context == HTML.BodyContext {
    static func grid(_ nodes: Node...) -> Node {
        .div(
            .id("layout"),
            .class("pure-g"),
            .group(nodes)
        )
    }
}
