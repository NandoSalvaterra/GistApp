//
//  DateExtension.swift
//  GistApp
//
//  Created by Luiz Fernando Salvaterra on 23/03/21.
//

import Foundation

extension Date {

    var readableText: String {
        let calendar = NSCalendar.autoupdatingCurrent
        if calendar.isDateInToday(self) {
            if getHoursDifferenceFromCurrentDateToNow() > 0 {
                return "last_update_at".localized + " \(getHoursDifferenceFromCurrentDateToNow()) \("hour_abbreviation".localized)"
            } else if getMinutesDifferenceFromCurrentDateToNow() > 0 {
                return "last_update_at".localized + " \(getMinutesDifferenceFromCurrentDateToNow()) \("minute_abbreviation".localized)"
            } else {
                return "last_update_now".localized
            }

        } else if calendar.isDateInYesterday(self) {
            return "last_update_yesterday".localized
        } else {
            return lastUpdateFullMessage
        }
    }

    private var lastUpdateFullMessage: String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        let format = "dd' \("last_update_date_of".localized) 'MMMM' \("last_update_date_at".localized) 'HH:mm"
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

    func getHoursDifferenceFromCurrentDateToNow() -> Int {
        let calendar = NSCalendar.autoupdatingCurrent
        let components = calendar.dateComponents([.hour], from: self, to: Date())
        return components.hour ?? 0
    }

    func getMinutesDifferenceFromCurrentDateToNow() -> Int {
        let calendar = NSCalendar.autoupdatingCurrent
        let components = calendar.dateComponents([.minute], from: self, to: Date())
        return components.minute ?? 0
    }

}
