//
//  DTLogFormatter.swift
//  Logger
//
//  Created by Burak Ceylan (Dogus Teknoloji) on 12.09.2023.
//

import Foundation
import OSLog

public protocol DTLogFormatter {
  func format(type: OSLogType, message: String, file: StaticString, function: StaticString, line: UInt, column: UInt) -> String
}

public class DefaultDTLogFormatter: DTLogFormatter {
  public init() {}

  public func format(type: OSLogType, message: String, file: StaticString, function: StaticString, line: UInt, column: UInt) -> String {
    let filename = (file.description as NSString).lastPathComponent
    return "[\(type)] [\(filename):\(line):\(column)] \(message)"
  }
}

extension OSLogType: CustomStringConvertible {
  public var description: String {
    switch self {
    case .info:
      return "info"

    case .debug:
      return "debug"

    case .error:
      return "error"

    case .fault:
      return "fault"

    case .default:
      return "msg"

    default:
      return "???"
    }
  }
}
