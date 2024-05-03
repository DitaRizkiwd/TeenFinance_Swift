//
//  Bundle+Ext.swift
//  TeenFinance
//
//  Created by MACBOOK PRO on 03/05/24.
//

import Foundation
extension Bundle {
    // 1. menentukan lokasi file jason
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = url.self(forResource: file, withExtension: nil) else {
            fatalError("failed to locate \(file) in bundle")
        }
        // 2. set dan load data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        // 3. buat decodernya
        let decoder = JSONDecoder()
        
        //4. simpan sebagai properti dari hasil data json yang sudah di decode
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bunlde")
        }
        //5. return data yang sudah di decode
        return loaded
    }
}
