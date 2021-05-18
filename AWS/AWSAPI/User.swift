// swiftlint:disable all
import Amplify
import Foundation

public struct User: Model {
  public let id: String
  public var name: String?
  public var catchPhrase: String?
  public var creationDate: Temporal.DateTime?
  public var age: Int?
  public var weight: Double?
  public var nicknames: [String]?
  public var gender: Gender?
  public var location: Location?
  public var Pets: List<Pet>?
  public var Communities: List<UserCommunity>?
  
  public init(id: String = UUID().uuidString,
      name: String? = nil,
      catchPhrase: String? = nil,
      creationDate: Temporal.DateTime? = nil,
      age: Int? = nil,
      weight: Double? = nil,
      nicknames: [String]? = [],
      gender: Gender? = nil,
      location: Location? = nil,
      Pets: List<Pet>? = [],
      Communities: List<UserCommunity>? = []) {
      self.id = id
      self.name = name
      self.catchPhrase = catchPhrase
      self.creationDate = creationDate
      self.age = age
      self.weight = weight
      self.nicknames = nicknames
      self.gender = gender
      self.location = location
      self.Pets = Pets
      self.Communities = Communities
  }
}