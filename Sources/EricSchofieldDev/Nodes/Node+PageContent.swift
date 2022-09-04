//
//  File.swift
//  
//
//  Created by Eric Schofield on 8/22/22.
//

import Plot
import Publish

extension Node where Context == HTML.BodyContext {

    static func pageContent(_ nodes: Node...) -> Node {
        .div(
            .class("content pure-u-1 pure-u-md-3-5 pure-u-xl-6-10"),
            .group(nodes)
        )
    }
}
