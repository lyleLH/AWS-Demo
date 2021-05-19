// swiftlint:disable all
import Amplify
import Foundation

public struct UserCommunity: Model {
  public let id: String
  public var user: User
  public var community: Community
  
  public init(id: String = UUID().uuidString,
      user: User,
      community: Community) {
      self.id = id
      self.user = user
      self.community = community
  }
}