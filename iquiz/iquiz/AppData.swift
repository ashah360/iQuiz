//
//  AppData.swift
//  iquiz
//
//  Created by Arman Shah on 11/6/18.
//  Copyright © 2018 Arman Shah. All rights reserved.
//

import UIKit

class AppData: NSObject {
    static var shared = AppData()
    
    open var subjects = ["Sports", "Games", "Music"]
    open var descriptions = ["Lets get sweaty", "Video Games", "Feel the melody"]
    open var images = ["sports", "games", "music"]
    
    open var topicIndex = 0
    open var numGuessed = 0
    open var numRight = 0
    
    open var questionText = ""
    open var answerText = ""
    open var correctAnswer = false
    
    open var sportsQuestions: [String] = ["What city hosted the 2012 Olympics?", "How long is an olympic swimming pool?", "Who was the NBA's first unanimous MVP?", "Which team won the 2018 FIFA World Cup?"]
    open var gameQuestions: [String] = ["What does Mario jump on after completing a level?", "What is the most popular PC game released in 2009?", "Which franchise is the phrase 'gotta catch em all' from?", "Which game won Game of the Year 2017?"]
    open var musicQuestions: [String] = ["Which electronic artist/group does NOT wear a helmet?", "Which hip hop artist released his #1 album Astroworld in 2018?", "Which musical artist is known for his popular clothing line in collaboration with Adidas?", "Which popular music festival occurs annually in the Indio Valley?"]
    
    open var sportsChoices: [[String]] = [["Los Angeles", "London", "Rio", "New York"], ["25 meters", "50 meters", "100 meters", "200 meters"], ["Magic Johnson", "Michael Jordan", "Steph Curry", "LeBron James"], ["France", "Croatia", "England", "Mexico"]]
    open var gameChoices = [["Mushroom", "Luigi", "Flagpole", "Mountain"], ["Minecraft", "Wizard101", "League of Legends", "Overwatch"], ["Super Smash Bros", "Mario Brothers", "Call of Duty", "Pokemon"], ["Call of Duty", "Legend of Zelda", "Super Smash Bros", "Overwatch"]]
    open var musicChoices = [["Skrillex", "Marshmello", "Deadmau5", "Daft Punk"], ["Lil Uzi Vert", "Travis Scott", "A$AP Rocky", "Kodak Black"], ["The Weeknd", "Tyler the Creator", "Travis Scott", "Kanye West"], ["Electric Daisy Carnival", "Stagecoach", "Coachella", "Burning Man"]]
    
    open var sportsAnswers: [String] = ["London", "50 meters", "Steph Curry", "France"]
    open var gameAnswers: [String] = ["Flagpole", "Minecraft", "Pokemon", "Legend of Zelda"]
    open var musicAnswers: [String] = ["Skrillex", "Travis Scott", "Kanye West", "Coachella"]
    
}
