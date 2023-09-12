//
//  DTLog+Extension.swift
//  Scaffold
//
//  Created by Burak Ceylan (Dogus Teknoloji) on 12.09.2023.
//

import Foundation
import Logger

extension DTLog {
  private static let subsystem = Bundle.main.bundleIdentifier ?? Bundle.main.bundleURL.lastPathComponent

  static let statistic = DTLog(subsystem: subsystem, category: "statistic", isEnabled: true)
  static let viewCycle = DTLog(subsystem: subsystem, category: "viewCycle", isEnabled: true)
}
