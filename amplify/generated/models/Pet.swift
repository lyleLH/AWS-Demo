// swiftlint:disable all
import Amplify
import Foundation

public struct Pet: Model {
  public let id: String
  public var name: String?
  public var userID: String?
  
  public init(id: String = UUID().uuidString,
      name: String? = nil,
      userID: String? = nil) {
      self.id = id
      self.name = name
      self.userID = userID
  }
}