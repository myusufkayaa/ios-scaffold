//
//  LoggingContracts.swift
//  
//
//  Created by Burak Ceylan (Dogus Teknoloji) on 1.09.2023.
//

import Foundation
import OSLog


public enum PrivacyLevel {
  case `public`
  case `private`
  case sensitive
  case auto
}

public enum LogCategory: String {
  case viewcycle
  case statistics
}


public enum LoggingLevel: Int {
  case none = -1
  case trace
  case debug
  case info
  case notice
  case warning
  case error
  case critical
}

extension LoggingLevel {
  internal var logSymbol: String {
    switch self {
    case .none:
      return ""
    case .trace:
      return "▶️"
    case .debug:
      return "➡️"
    case .info:
      return "ℹ️"
    case .notice:
      return "💡"
    case .warning:
      return "⚠️"
    case .error:
      return "⛔️"
    case .critical:
      return "❌"
    }
  }
}

