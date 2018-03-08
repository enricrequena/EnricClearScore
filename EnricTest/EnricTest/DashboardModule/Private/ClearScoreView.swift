//
//  Copyright © 2018 ERT Limited. All rights reserved.
//

import UIKit
import QuartzCore

class ClearScoreView: UIView {

	@IBOutlet weak var scorePercentageView: UIView!
	@IBOutlet weak var line1Label: UILabel!
	@IBOutlet weak var scoreValueGradientView: UIView!
	@IBOutlet weak var scoreValueLabel: UILabel!
	@IBOutlet weak var line2Label: UILabel!

	override init(frame: CGRect) {

		super.init(frame: frame)

		makeBorderCircle()
	}

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

		makeBorderCircle()
    }

	override func awakeFromNib() {

		applyGradientToScoreValue()
	}

	func update(with viewModel: DashboardViewModel) {

		line1Label.text = viewModel.line1
		scoreValueLabel.text = viewModel.scoreValue
		line2Label.text = viewModel.line2

		drawScorePercentageView(viewModel.percentage)
	}
}

extension ClearScoreView {

	private func makeBorderCircle() {

		layer.cornerRadius = layer.frame.size.width * 0.5
		layer.borderColor = UIColor(red: 98.0/255.0, green: 98.0/255.0, blue: 98.0/255.0, alpha: 1.0).cgColor
		layer.borderWidth = 2.0
	}

	private func applyGradientToScoreValue() {

		let frame = scoreValueGradientView.bounds
		let fromColor = UIColor.red
		let toColor = UIColor.blue
		let gradient = makeGradient(withFrame: frame, fromColor: fromColor, toColor: toColor)
		
		scoreValueGradientView.layer.addSublayer(gradient)

		scoreValueGradientView.mask = scoreValueLabel
	}

	private func drawScorePercentageView(_ scorePercentage: Float) {

		let arcCenter = CGPoint(
			x: scorePercentageView.bounds.width * 0.5,
			y: scorePercentageView.bounds.height * 0.5
		)
		let radious: CGFloat = scorePercentageView.bounds.width * 0.46
		let circlePath = UIBezierPath(
			arcCenter: arcCenter,
			radius: radious,
			startAngle: CGFloat(-Double.pi * 0.5),
			endAngle: CGFloat(-Double.pi * 0.5 + Double.pi * 2),
			clockwise: true
		)

		let shapeLayer = CAShapeLayer()
		shapeLayer.frame = scorePercentageView.frame
		shapeLayer.path = circlePath.cgPath
		shapeLayer.strokeColor = UIColor.black.cgColor
		shapeLayer.strokeStart = 0
		shapeLayer.strokeEnd = CGFloat(scorePercentage)
		shapeLayer.fillColor = UIColor.clear.cgColor
		shapeLayer.lineWidth = 5
		shapeLayer.lineCap = "round"

		scorePercentageView.layer.addSublayer(shapeLayer)

		let frame = scorePercentageView.frame
		let fromColor = UIColor(red: 244.0/255.0, green: 180.0/255.0, blue: 116.0/255.0, alpha: 1.0)
		let toColor = UIColor(red: 244.0/255.0, green: 223.0/255.0, blue: 129.0/255.0, alpha: 1.0)
		let gradient = makeGradient(withFrame: frame, fromColor: fromColor, toColor: toColor)
		gradient.mask = shapeLayer

		scorePercentageView.layer.addSublayer(gradient)
	}

	private func makeGradient(
		withFrame frame: CGRect,
		fromColor: UIColor,
		toColor: UIColor) -> CAGradientLayer {

		let gradient = CAGradientLayer()
		gradient.frame = frame
		gradient.colors = [fromColor.cgColor, toColor.cgColor]
		gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
		gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
		return gradient
	}
}
