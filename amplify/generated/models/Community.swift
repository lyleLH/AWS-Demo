// swiftlint:disable all
import Amplify
import Foundation

public struct Community: Model {
  public let id: String
  public var name: String?
  public var users: List<UserCommunity>?
  
  public init(id: String = UUID().uuidString,
      name: String? = nil,
      users: List<UserCommunity>? = []) {
      self.id = id
      self.name = name
      self.users = users
  }
}