//
//  Resourses.swift
//  WorkoutApp
//
//  Created by Александр on 5/18/23.
//

import UIKit

enum Resourses{
    enum Colors{
        static var active = UIColor(hexString: "#437BFE")
        static var inactive = UIColor(hexString: "#929DA5")
        
        static var separator = UIColor(hexString: "#E8ECEF")
        static var titleGray = UIColor(hexString: "#545C77")
        static var backGround = UIColor(hexString: "#F8F9F9")
        static var secondary = UIColor(hexString: "#F0F3FF")
    }
    
    enum Strings {
        enum TabBar {
            static var overview = "Обзор"
            static var session = "Сессии"
            static var progress = "Прогресс"
            static var settings = "Настройки"
        }
        
        enum NavBar {
            static var overview = "Сегодня"
        }
        
        enum Overview{
            static var allWorcoutsButton = "Все Тренировки"
        }
        
        enum Session{
            static var navBarStart = "Старт"
            static var navBarPause = "Пауза"
            static var navBarFinish = "Конец"
            
            static let elapsedTime = "Пройденное время"
            static let remainingTime = "Оставшееся Время"
            static let completed = "Завершено"
            static let remaining = "Осталось"

            static let workoutStats = "Статистика тренировок"
            static let averagePace = "Средний темп"
            static let heartRate = "Частота сердцебиения"
            static let totalDistance = "Общее расстояние"
            static let totalSteps = "Всего шагов"

            static let stepsCounter = "Счетчик шагов"
        }
        
        enum Progress {
                    static let navBarLeft = "Поделиться"
                    static let navBarRight = "Детали"

                    static let dailyPerformance = "Ежедневное"
                    static let last7Days = "7 дней"
                    static let monthlyPerformance = "Ежемесячное"
                    static let last10Months = "10 месяцев"
                }
    }
    
    
    
    enum Image {
        static var overview = UIImage(named: "House Icon")
        static var session = UIImage(named: "Clock Icon")
        static var progress = UIImage(named: "Analytics Bars")
        static var settings = UIImage(named: "Gear Icon")
        
        enum Common{
            static var allWorcoutsButton = UIImage(named: "Down Arrow")
        }
        enum AddButtom {
            static var addBotton = UIImage(named: "Add")
        }
        
        enum Overview {
            static let rightArrow = UIImage(named: "Right Arrow")
            static let oval = UIImage(named: "Oval")
            static let checked = UIImage(named: "Checked")
        }
        
        enum Session {
                    enum Stats {
                        static let averagePace = UIImage(named: "Speed Icon")
                        static let heartRate = UIImage(named: "Heart Beat Icon")
                        static let totalDistance = UIImage(named: "Maps Icon")
                        static let totalSteps = UIImage(named: "Steps Icon")
                    }
                }
    }
    
    enum Fonts{
            static func helveticaRegular(with size: CGFloat) -> UIFont{
                UIFont(name: "Helvetica", size: size) ?? UIFont()
            }
        }

}

