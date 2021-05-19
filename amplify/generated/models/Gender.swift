// swiftlint:disable all
import Amplify
import Foundation

public enum Gender: String, EnumPersistable {
  case female = "FEMALE"
  case male = "MALE"
  case other = "OTHER"
}