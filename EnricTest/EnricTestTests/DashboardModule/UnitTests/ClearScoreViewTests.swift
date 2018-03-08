//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

import Foundation

import XCTest
import QuartzCore
import UIKit
@testable import EnricTest

class ClearScoreViewTests: XCTestCase {

    var clearScoreView: ClearScoreView!

    override func setUp() {

        super.setUp()

        let dashboardViewController = loadDashboardViewController()
        dashboardViewController.loadViewIfNeeded()

        clearScoreView = dashboardViewController.clearScoreView
    }

    override func tearDown() {

        clearScoreView = nil
        super.tearDown()
    }

    // MARK: - Init methos

    func testInit_WithFrame() {

        clearScoreView = ClearScoreView(frame: .init(x: 0, y: 0, width: 100, height: 100))

        XCTAssertEqual(clearScoreView.layer.cornerRadius, clearScoreView.layer.frame.size.width * 0.5)
        XCTAssertEqual(clearScoreView.layer.borderColor, UIColor(red: 98.0 / 255.0, green: 98.0 / 255.0, blue: 98.0 / 255.0, alpha: 1.0).cgColor)
        XCTAssertEqual(clearScoreView.layer.borderWidth, 2.0)
    }

    func testInit_WithCoder() {

        XCTAssertEqual(clearScoreView.layer.cornerRadius, clearScoreView.layer.frame.size.width * 0.5)
        XCTAssertEqual(clearScoreView.layer.borderColor, UIColor(red: 98.0 / 255.0, green: 98.0 / 255.0, blue: 98.0 / 255.0, alpha: 1.0).cgColor)
        XCTAssertEqual(clearScoreView.layer.borderWidth, 2.0)
    }

    // MARK: - awakeFromNib

    func testAwakeFromNib() {

        guard let sublayers = clearScoreView.scoreValueGradientView.layer.sublayers,
              sublayers.count == 1,
              let gradient = sublayers.first as? CAGradientLayer else {

            XCTFail("CAGradientLayer not configured")
            return
        }
        guard let colors = gradient.colors as? [CGColor], colors.count == 2 else {

            XCTFail("CAGradientLayer with no colors configured")
            return
        }
        XCTAssertEqual(colors.first, UIColor.red.cgColor)
        XCTAssertEqual(colors.last, UIColor.blue.cgColor)
        XCTAssertEqual(gradient.startPoint, CGPoint(x: 0.0, y: 0.5))
        XCTAssertEqual(gradient.endPoint, CGPoint(x: 1.0, y: 0.5))
        XCTAssertEqual(gradient.frame, clearScoreView.scoreValueGradientView.bounds)

        XCTAssert(clearScoreView.scoreValueGradientView.mask === clearScoreView.scoreValueLabel)
    }

    func testUpdate() {

        let line1 = "first line here"
        let scoreValue = "340"
        let line2 = "second line here"
        let percentage: Float = 0.67

        let viewModel = DashboardViewModel.Builder()
            .withLine1(line1)
            .withScoreValue(scoreValue)
            .withLine2(line2)
            .withPercentage(percentage)
            .build()

        clearScoreView.update(with: viewModel)

        XCTAssertEqual(clearScoreView.line1Label.text, line1)
        XCTAssertEqual(clearScoreView.scoreValueLabel.text, scoreValue)
        XCTAssertEqual(clearScoreView.line2Label.text, line2)

        guard let sublayers = clearScoreView.scorePercentageView.layer.sublayers,
              sublayers.count == 1,
              let gradient = sublayers.last as? CAGradientLayer else {

            XCTFail("CAGradientLayer not configured")
            return
        }
		guard let colors = gradient.colors as? [CGColor], colors.count == 2 else {

			XCTFail("CAGradientLayer with no colors configured")
			return
		}
		XCTAssertEqual(colors.first, UIColor(red: 244.0/255.0, green: 180.0/255.0, blue: 116.0/255.0, alpha: 1.0).cgColor)
		XCTAssertEqual(colors.last, UIColor(red: 244.0/255.0, green: 223.0/255.0, blue: 129.0/255.0, alpha: 1.0).cgColor)
		XCTAssertEqual(gradient.startPoint, CGPoint(x: 0.0, y: 0.5))
		XCTAssertEqual(gradient.endPoint, CGPoint(x: 1.0, y: 0.5))
		XCTAssertEqual(gradient.frame, clearScoreView.scorePercentageView.frame)

        guard let shapeLayer = gradient.mask as? CAShapeLayer else {

            XCTFail("CAShapeLayer not configured")
            return
        }
        let expectedPath = makeExpectedPathForCircleScorePercentageView()
        XCTAssertEqual(shapeLayer.path, expectedPath)
        XCTAssertEqual(shapeLayer.frame, clearScoreView.scorePercentageView.frame)
        XCTAssertEqual(shapeLayer.strokeColor, UIColor.black.cgColor)
        XCTAssertEqual(shapeLayer.strokeStart, 0)
        XCTAssertEqual(shapeLayer.strokeEnd, CGFloat(percentage))
        XCTAssertEqual(shapeLayer.fillColor, UIColor.clear.cgColor)
        XCTAssertEqual(shapeLayer.lineWidth, 5)
        XCTAssertEqual(shapeLayer.lineCap, "round")
    }
}

extension ClearScoreViewTests {

	private func makeExpectedPathForCircleScorePercentageView() -> CGPath {

		let arcCenter = CGPoint(
			x: clearScoreView.scorePercentageView.bounds.width * 0.5,
			y: clearScoreView.scorePercentageView.bounds.height * 0.5
		)
		let radious: CGFloat = clearScoreView.scorePercentageView.bounds.width * 0.46
		let circlePath = UIBezierPath(
			arcCenter: arcCenter,
			radius: radious,
			startAngle: CGFloat(-Double.pi * 0.5),
			endAngle: CGFloat(-Double.pi * 0.5 + Double.pi * 2),
			clockwise: true
		)
		return circlePath.cgPath
	}

    private func loadDashboardViewController() -> DashboardViewController {

        let navigationController = UIStoryboard(
            name: "Main",
            bundle: .main
        ).instantiateInitialViewController() as! UINavigationController

        return navigationController.topViewController as! DashboardViewController
    }
}

