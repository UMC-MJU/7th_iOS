import UIKit

struct Tinipingmodel {
    let image: UIImage
    let name: String
}

extension Tinipingmodel {
    static func dummy() -> [Tinipingmodel] {
        return [
            Tinipingmodel(image: UIImage(named: "hachuping1") ?? UIImage(), name: "하츄핑1"),
            Tinipingmodel(image: UIImage(named: "hachuping2") ?? UIImage(), name: "하츄핑2"),
            Tinipingmodel(image: UIImage(named: "hachuping3") ?? UIImage(), name: "하츄핑3"),
            Tinipingmodel(image: UIImage(named: "hachuping4") ?? UIImage(), name: "하츄핑4"),
            Tinipingmodel(image: UIImage(named: "hachuping5") ?? UIImage(), name: "하츄핑5"),
            Tinipingmodel(image: UIImage(named: "hachuping6") ?? UIImage(), name: "하츄핑6"),
            Tinipingmodel(image: UIImage(named: "hachuping7") ?? UIImage(), name: "하츄핑7"),
            Tinipingmodel(image: UIImage(named: "hachuping8") ?? UIImage(), name: "하츄핑8")
        ]
    }
}

