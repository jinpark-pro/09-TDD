//
//  Array+Safe.swift
//  AlbertosTests
//
//  Created by Jungjin Park on 2024-07-11.
//

extension Array {
    subscript(safe index: Index) -> Element? {
        0 <= index && index < count ? self[index] : nil
    }
}
