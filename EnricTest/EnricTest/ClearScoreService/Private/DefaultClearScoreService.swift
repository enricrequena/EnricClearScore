//
// Copyright (c) 2018 ERT Limited. All rights reserved.
//

import Foundation

enum ClearScoreServiceError: Error {

    case invalidURL(message: String)
    case requestFailed(message: String)
}

class DefaultClearScoreService {

    private let urlSession: URLSession

    init() {

        let configuration = URLSessionConfiguration.default
        // Set wait for connectivity to true to periodically retry the request in case we lose connectivity
        configuration.waitsForConnectivity = true
        urlSession = URLSession(configuration: configuration)
    }
}

extension DefaultClearScoreService: ClearScoreService {

    func getReportInfo(completion: @escaping (Result<ReportInfoModel>) -> Void) {

        guard let url = makeURLForReportInfo() else {

            let failure = ClearScoreServiceError.requestFailed(message: "Unable to construct ReportInfo URL.")
            completion(.failure(failure))
            return
        }

        let dataTask = urlSession.dataTask(with: url) {

            (data: Data?, response: URLResponse?, error: Error?) -> Void in

			DispatchQueue.main.async {

				if let error = error {

					let failure = ClearScoreServiceError.requestFailed(message: error.localizedDescription)
					completion(.failure(failure))
				} else {

					guard let data = data else {

						let failure = ClearScoreServiceError.requestFailed(message: "No data returned.")
						completion(.failure(failure))
						return
					}

					guard let resultInfoModel = try? JSONDecoder().decode(ReportInfoModel.self, from: data) else {

						let failure = ClearScoreServiceError.requestFailed(message: "Unable to parse response.")
						completion(.failure(failure))
						return
					}

					completion(.success(resultInfoModel))
				}
			}
		}

		dataTask.resume()
    }
}

extension DefaultClearScoreService {

    private func makeURLForReportInfo() -> URL? {

        return URL(string: "https://s3.amazonaws.com/cdn.clearscore.com/native/interview_test/creditReportInfo.json")
    }
}
