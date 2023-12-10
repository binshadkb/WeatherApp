//
//  MockData.swift
//  iOS Tech TestTests
//
//  Created by Binshad K B on 09/12/23.
//

import Foundation

struct MockConstant {
    static let mockJson = """
{
   "coord":{
      "lon":0.1276,
      "lat":51.5072
   },
   "weather":[
      {
         "id":804,
         "main":"Clouds",
         "description":"overcast clouds",
         "icon":"04n"
      }
   ],
   "base":"stations",
   "main":{
      "temp":282.6,
      "feels_like":280.67,
      "temp_min":281.42,
      "temp_max":283.35,
      "pressure":1005,
      "humidity":82
   },
   "visibility":10000,
   "wind":{
      "speed":3.6,
      "deg":210
   },
   "clouds":{
      "all":88
   },
   "dt":1702058471,
   "sys":{
      "type":2,
      "id":2011528,
      "country":"GB",
      "sunrise":1702021887,
      "sunset":1702050677
   },
   "timezone":0,
   "id":7302135,
   "name":"Abbey Wood",
   "cod":200
}
"""
}
