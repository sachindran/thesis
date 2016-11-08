//
//  CoordinateService.swift
//  Maps
//
//  Created by Sachin Selvaraj on 10/22/16.
//  Copyright © 2016 sachin. All rights reserved.
//

import Foundation
import JavaScriptCore

class CoordinateService {
    lazy var context: JSContext? = {
        let context = JSContext()
        
        // 1
        guard let
            commonJSPath = Bundle.main.path(forResource: "google-geometry-lib", ofType: "js") else {
                print("Unable to read resource files.")
                return nil
        }
        
        // 2
        do {
            let common = try String(contentsOfFile: commonJSPath, encoding: String.Encoding.utf8)
            _ = context?.evaluateScript(common)
        } catch (let error) {
            print("Error while processing script file: \(error)")
        }
        
        return context
    }()
    
    func decodeCoordinatesFrom(encodedPath : String) -> [Coordinates]{
        guard let context = context else {
            print("JSContext not found.")
            return []
        }
        
        let decodePathFunc = context.objectForKeyedSubscript("decodePath")
        let decodedPath = decodePathFunc?.call(withArguments: [encodedPath]).toArray()
        
        // 1
        let builderBlock = unsafeBitCast(Coordinates.coordinatesBuilder, to: AnyObject.self)
        
        // 2
        context.setObject(builderBlock, forKeyedSubscript: "coordinatesBuilder" as (NSCopying & NSObjectProtocol)!)
        let builder = context.evaluateScript("coordinatesBuilder")
        
        // 3
        guard let unwrappedFiltered = decodedPath,
            let coordinates = builder?.call(withArguments: [unwrappedFiltered]).toArray() as? [Coordinates] else {
                print("Error while processing movies.")
                return []
        }
        return coordinates
    }
    
}
