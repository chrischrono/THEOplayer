//
//  Helpers.swift
//  TournamentTree
//
//  Created by Christian  Huang on 28/09/18.
//  Copyright © 2018 Christian Huang. All rights reserved.
//

import UIKit

/**
 Collections of basic func
 */

class Helpers {
    /**
     Fetched data from main bundle
     - Parameter name: filename of the data file.
     - Parameter extension: extension of the data file.
     */
    static func loadDataFromBundle(withName name: String, extension: String) ->  Data? {
        let bundle = Bundle.main
        let url = bundle.url(forResource: name, withExtension: `extension`)
        
        let data = try? Data(contentsOf: url!)
        return data
    }
}
