//
//  MenuFetching.swift
//  Albertos
//
//  Created by Jungjin Park on 2024-07-11.
//

import Combine

protocol MenuFetching {
    func fetchMenu() -> AnyPublisher<[MenuItem], Error>
}
