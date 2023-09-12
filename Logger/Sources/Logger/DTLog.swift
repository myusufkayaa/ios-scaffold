//
//  DTLog.swift
//  Logger
//
//  Created by Burak Ceylan (Dogus Teknoloji) on 12.09.2023.
//

import Foundation
import OSLog

public class DTLog {
  public static let `default` = DTLog(OSLog.default, formatter: DefaultDTLogFormatter(), isEnabled: true)

  public let osLog: OSLog

  private let formatter: DTLogFormatter

  public var isEnabled: Bool

  public convenience init(subsystem: String, category: String, formatter: DTLogFormatter = DefaultDTLogFormatter(), isEnabled: Bool) {
    self.init(OSLog(subsystem: subsystem, category: category), formatter: formatter, isEnabled: isEnabled)
  }

  private init(_ osLog: OSLog, formatter: DTLogFormatter, isEnabled: Bool) {
    self.osLog = osLog
    self.formatter = formatter
    self.isEnabled = isEnabled
  }

  private func log(_ type: OSLogType, _ message: @autoclosure () -> String, file: StaticString = #file, function: StaticString = #function, line: UInt = #line, column: UInt = #column) {
    guard self.isEnabled else {
      return
    }

    let formatted = self.formatter.format(type: type, message: message(), file: file, function: function, line: line, column: column)
    os_log("%{public}@", log: self.osLog, type: type, formatted)
  }
}

// MARK: - Instance methods

extension DTLog {
  public func msg(_ message: @autoclosure () -> String, file: StaticString = #file, function: StaticString = #function, line: UInt = #line, column: UInt = #column) {
    self.log(.default, message(), file: file, function: function, line: line, column: column)
  }

  public func info(_ message: @autoclosure () -> String, file: StaticString = #file, function: StaticString = #function, line: UInt = #line, column: UInt = #column) {
    self.log(.info, message(), file: file, function: function, line: line, column: column)
  }

  public func debug(_ message: @autoclosure () -> String, file: StaticString = #file, function: StaticString = #function, line: UInt = #line, column: UInt = #column) {
    self.log(.debug, message(), file: file, function: function, line: line, column: column)
  }

  public func error(_ message: @autoclosure () -> String, file: StaticString = #file, function: StaticString = #function, line: UInt = #line, column: UInt = #column) {
    self.log(.error, message(), file: file, function: function, line: line, column: column)
  }

  public func fault(_ message: @autoclosure () -> String, file: StaticString = #file, function: StaticString = #function, line: UInt = #line, column: UInt = #column) {
    self.log(.fault, message(), file: file, function: function, line: line, column: column)
  }
}

// MARK: - Static methods

extension DTLog {
  public static func msg(_ message: @autoclosure () -> String, file: StaticString = #file, function: StaticString = #function, line: UInt = #line, column: UInt = #column) {
    DTLog.default.msg(message(), file: file, function: function, line: line, column: column)
  }

  public static func info(_ message: @autoclosure () -> String, file: StaticString = #file, function: StaticString = #function, line: UInt = #line, column: UInt = #column) {
    DTLog.default.info(message(), file: file, function: function, line: line, column: column)
  }

  public static func debug(_ message: @autoclosure () -> String, file: StaticString = #file, function: StaticString = #function, line: UInt = #line, column: UInt = #column) {
    DTLog.default.debug(message(), file: file, function: function, line: line, column: column)
  }

  public static func error(_ message: @autoclosure () -> String, file: StaticString = #file, function: StaticString = #function, line: UInt = #line, column: UInt = #column) {
    DTLog.default.error(message(), file: file, function: function, line: line, column: column)
  }

  public static func fault(_ message: @autoclosure () -> String, file: StaticString = #file, function: StaticString = #function, line: UInt = #line, column: UInt = #column) {
    DTLog.default.fault(message(), file: file, function: function, line: line, column: column)
  }
}
