import UIKit
import SpriteKit
import GameplayKit

enum NoiseTileType: CustomStringConvertible {
    case ocean
    case grass
    case mountain
    
    static let all: [NoiseTileType] = [.ocean, .grass, .mountain]
    
    var range: Range<Float> {
        switch self {
        case .ocean:
            return -1..<0
        case .grass:
            return 0..<0.6
        case .mountain:
            return 0.6..<1
        }
    }
    
    var description: String {
        switch self {
        case .ocean:
            return "🔵"
        case .grass:
            return "🌲"
        case .mountain:
            return "🍂"
        }
    }
}

class NoiseTile {
    var type: NoiseTileType
    
    init(value: Float) {
        type = .ocean
        for noiseType in NoiseTileType.all {
            if noiseType.range.contains(value) {
                type = noiseType
            }
        }
    }
}

class NoiseTileMap {
    var map: String
    var size: vector_int2
    
    init(noiseMap: GKNoiseMap, size: vector_int2 = vector_int2(64, 64)) {
        self.size = size
        var tempMap = ""
        for x in 0..<size.x {
            for y in 0..<size.y {
                let value = noiseMap.value(at: vector_int2(Int32(x), Int32(y)))
                let tile = NoiseTile(value: value)
                tempMap += "\(tile.type)"
            }
            tempMap += "\n"
        }
        map = tempMap
    }
}


let noise = GKNoise(GKPerlinNoiseSource())
let noiseMap = GKNoiseMap(noise)
let noiseTileMap = NoiseTileMap(noiseMap: noiseMap, size: vector_int2(32, 32))
print(noiseTileMap.map)
