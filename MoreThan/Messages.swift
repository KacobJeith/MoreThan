//
//  Messages.swift
//  MoreThan
//
//  Created by Jacob Keith on 5/24/17.
//  Copyright © 2017 KacobJeith. All rights reserved.
//

import Foundation
import RealmSwift

class MessageGenerater {
    
    func generateMessages() {
                
        var all = [Message]()
        var counter = 0
        
        
        
        var next = assembleMessage(caption: "...all the death-defying steps we took to take this picture together. What's love without a little vertigo?? Look at us soar!",
                                   image: "angelslanding",
                                   id: counter)
        counter += 1
        all.append(next)
        
        next = assembleMessage(caption: "...all the roomates we've had combined! I'm so happy I get to wake up next to you every day!",
                               image: "1400",
                               id: counter)
        counter += 1
        all.append(next)
        
        next = assembleMessage(caption: "...all the great things happening in this picture. I love you more than all the college nights we don't remember, all the times Maricela has inadvertently gotten in the middle of our love, and all the sexiness in my staredown",
                               image: "allnighters",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        
        next = assembleMessage(caption: "...all of the ugly Renaissance babies in all the art we've ever seen together! I love your passion for art and the science of restoration!",
                                   image: "art",
                                   id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...you love the white bark on aspen trees. ",
                               image: "aspen",
                               id: counter)
        counter += 1
        all.append(next)
        
        next = assembleMessage(caption: "...all the sass in this sexy....(hehe)... Also more than how embarassed he was that a stranger caught him in the act while sneaking this picture. Oh well...still worth it!",
                                   image: "ass",
                                   id: counter)
        counter += 1
        all.append(next)
        
        next = assembleMessage(caption: "...all the balconies in all the cities! Miami, Monaco, Taipei, all of them! Even the grandest balcony of all: our 1400 Bedford grand juliet balcony! The only ones worth being on are the ones he gets to share with you <3",
                               image: "balcony",
                               id: counter)
        counter += 1
        all.append(next)
        
        next = assembleMessage(caption: "...all adventures we had in NYC during college with all the shitty subway photo ops. Also those bangs!",
                               image: "bangs",
                               id: counter)
        counter += 1
        all.append(next)
        
        next = assembleMessage(caption: "...he loves beef. He thinks...maybe. No he definitely loves you more than beef. yes.",
                               image: "beef",
                               id: counter)
        counter += 1
        all.append(next)
        
        next = assembleMessage(caption: "...bliss! And more than Bliss's pitiful mystery tumor/growth. And more than being covered in puppy love. Being with you is like having a little puppy bliss on my shoulder every day!",
                               image: "bliss",
                               id: counter)
        counter += 1
        all.append(next)
        
        next = assembleMessage(caption: "...all the snowflakes in all the blizzards we've experienced over the last 8 years together in NYC! Being with you is better than tracking the most spectacular blizzards. You are the most exquisite feat of mother nature!",
                               image: "blizzard",
                               id: counter)
        counter += 1
        all.append(next)
        
        next = assembleMessage(caption: "...all the green and all the freely roaming animals in all of Botswana! All the impala, elephants, giraffe, hippo, giraffe...I mean zebra",
                               image: "botswana",
                               id: counter)
        counter += 1
        all.append(next)
        
        next = assembleMessage(caption: "...I love eating ice cream for breakfast out of a caterpillar crib. I love you more than all the little weekend roadtrip adventures we've shared together!",
                               image: "caterpillar",
                               id: counter)
        counter += 1
        all.append(next)
        
                
        next = assembleMessage(caption: "...the ridiculousness of getting free take-home champagne on a flight just for being related to your dad",
                               image: "champagne",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the times it took him to bring you these chocolates in all their glory, plus all the times we brought each other little sweets in the past 8 years <3",
                               image: "chocolates",
                               id: counter)
        counter += 1
        all.append(next)
        
        next = assembleMessage(caption: "...every bulb on the Rockefeller Christmas Tree! Plus all the other lights in Rockefeller Center! Plus all the OTHER lights in Times Square! All the lights are our love!",
                               image: "christmas",
                               id: counter)
        counter += 1
        all.append(next)
        
        next = assembleMessage(caption: "...Clark loves literally any interaction. I hope you are getting your fill of everything feline out there in Sardes!",
                               image: "clark",
                               id: counter)
        counter += 1
        all.append(next)
        
        next = assembleMessage(caption: "...all the feet (not meters!) in the CN Tower! Even including all the human feet standing on that terrifying panel of glass.",
                               image: "cntower",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the hours I spent in your room. Clearly we had the most special and stimulating conversations lol",
                               image: "college",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the hours of studying, all the shots of shitty vodka, all the laughs, all the tears, and all the problem sets it took for us to get here together!",
                               image: "collegefriends",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the costumes in NYC on Halloween, and all the costumes you see randomly on other days too. This was 8 years ago!",
                               image: "costumes",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the daisies and all the awws!",
                               image: "daisy",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the melted paintings and broken objects that need their Mud Angel to come to the rescue! You're a hero!",
                               image: "deadpainting",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the times we choose to stay home and do work instead of going out. We have fun just being together, we embrace our quicks <3",
                               image: "deerhat",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the desert blooms in all of Utah!",
                               image: "desertflower",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the cliffs in all of Zion! You are my chains, my dangerously beautiful cactus blook on a cliffside. I would climb 3000 steps and dangle from a cliffside to pluck you and keep you all to myself <3",
                               image: "desertflowercliff",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the DMD I've ever consumed. Also even more than I love that you now chug from 2 liters with me <3",
                               image: "dmd",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the double dates, all the stingray masterpieces, all the walks along canals and through the woods",
                               image: "doubledates",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the close calls we had on the 'roads' in Sri Lanka!",
                               image: "driving",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the good times and all the tough times. We keep each other smiling through it all. Also I love you more than all the overexposed pictures, and all the shining earrings on all those classy ladies who are copying your style and wearing your exact earrings",
                               image: "earrings",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the times we realized we are actually slowly converging into the same person.",
                               image: "faceswap",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the fancy cars in all of Monaco. I'd rather drive a tuk-tuk for the rest of my life if it means we can be together <3",
                               image: "ferrari",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all wine stains and all the brilliant ideas we've had like gjumping into fountains together <3",
                               image: "fountain",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...front row tickets to the Knicks! There's no sport as special as being with you!",
                               image: "frontrow",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the hours we spent watching Battlestar Galactica, and all the Gaius moments combined.",
                               image: "gaius",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the horribly incriminating photos you took of us throughout college. IMA GETCHU <3",
                               image: "getchu",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the trash and all the sludge and all the mutant fish in the Gowanus Canal combined!",
                               image: "gowanus",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the rocks in the entire Grand Canyon! We need to go back and explore someday <3",
                               image: "grandcanyon",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the trains that have ever passed through Grand Central Station throughout all of time! I love you more than all the times you've had an awkward collision with someone else on the subway! That's a lot of love!",
                               image: "grandcentral",
                               id: counter)
        counter += 1
        all.append(next)
        
        next = assembleMessage(caption: "...all the fuel ever consumed by all the formula one vehicles...no all the vehicles EVER! Woah that's a lot!",
                               image: "grandprix",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the hours it took to build these devices. PLUS all the hours we've yet to spend finishing them....sigh. I couldn't do it without you!",
                               image: "heepboys",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the evenings we get to sit together and work alongside each other to achieve our dreams!",
                               image: "homeoffice",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the times I've worn hoodies with a hat!",
                               image: "hoodies",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the hours we've spent IKEA shopping -__-. Somehow you make IKEA not only bearable, but fun <4",
                               image: "ikeashopping",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...how dorky Joey is lol",
                               image: "joeylol",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...KETCHUP. Yes, I mean it. ",
                               image: "ketchup",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the photons in the entire universe. If you add them all up, it is still less than my love for you!",
                               image: "light",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all class in Florida. And that's saying a lot, it's hard to top the class on display in Florida.",
                               image: "limotruck",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...he loves Lula Bagel. Lula Bagel is only good when shared with you!",
                               image: "lula",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the islands in all the oceans! We definitely need to go to the Maldives btw... <3",
                               image: "maldives",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the buildings and all the people in all of Manhattan!",
                               image: "manhattan",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...cheers-ing with Miu",
                               image: "miudrinks",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...you love this cartoon <3. And more than all the chuckles we've shared on all the reddits!",
                               image: "molarbear",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the creepy paired overtly-culturally-diverse mormon girls in all of Salt Lake City. *shudder*",
                               image: "mormons",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the mahhhhhhnkeeeeeeeeys in all of Sri Lanks, PLUS all the monkeys in Taiwan! So many Maahhhhhhnkeeys, so many love!",
                               image: "monkeys",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the times we helped eachother move apartments! I'm sure we have many more ahead of us too <3",
                               image: "moving",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the defects on all the wafers - trust me thats a lot!",
                               image: "nanodefects",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the water that ever flowed through Niagra Falls. SOOOOOOOOO much water and love! ",
                               image: "niagra",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the ice in the entire North Pole! Except...my love for you isn't shrinking like the polar ice caps, its growing every day!",
                               image: "northpole",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the birthday parties there ever were. With over 6 Billion people, think of all the birthdays! Still less that my love for you!",
                               image: "parkfriends",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all kisses <3. I can't kiss you enough to express my love, so sometimes I have to outsource my kisses to Miu, he's a big help",
                               image: "parkkises",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the penguins! and all the feathers on all those penguins! Warmmmmmm",
                               image: "penguins",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the pitstains I've ever had. The collective volume is less than the volume of my love for you <3 - you KNOW that's enormous",
                               image: "pitstains",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the portraits of the Prince of Monaco!",
                               image: "prince",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the priceless relics throughout all of Sri Lanka! If you added them all together and sold them at a garage sale, it would still be way less than my love for you babe",
                               image: "relics",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the splashes in all the rivers. I would say manatees but we know there just aren't very many of those",
                               image: "river",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the fun being had at all the senior proms. This is still like my favorite photo ever <3",
                               image: "seniorprom",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the sexiness on top of all the mountains. The angel of sexiness has landed",
                               image: "sexyangel",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the signs in all the countries. And with places like Sri Lanka, that's a lot of signs!",
                               image: "signs",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the protons and neutrons and electrons in all the snowflakes in Taiwan. Maybe there aren't many snowflakes total, but there's bound to be lot's of fundamental building blocks of nature regardless!",
                               image: "snowflake",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...than I hate spiders. I'd probably even crawl through a clausterphobic tunnel to rescue you from a horde of spiders because I love you so much. Probably...",
                               image: "spiders",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the curves on all the roads in Sri Lanka! Just look at that map, that place is full of em! Still less than I love you though",
                               image: "srilankaroads",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the sticks under all the boulders in all of Sri Lanka. There may be tons of sticks under boulders, but still less than I love you!",
                               image: "sticks",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the happy dances in all the streets in all the world ^.^",
                               image: "streetdancing",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the subways we've ever ridden or hiked. With your commute, that's a lot of subways!",
                               image: "subway2",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the sunsets across all time! Considering the sun is always setting somewhere, that's like infinite love - very accurate!",
                               image: "sunset",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the takeout I've ever ordered. Seamless is my life, and so are you!",
                               image: "takeout",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the hours we've spent playing Terra Mystica together. Plus all the dumplings!",
                               image: "terramystica",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...he loves driving Teslas. More than sustainable energy, and more than mars!",
                               image: "tesla",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...walking. I would sit down and be a parapalegic and just watch the world go by if you needed me to <3",
                               image: "walks",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the wasps in Sri Lanka. Look at all those wasps ewwww",
                               image: "wasps",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the 'water bottles' in all the Tuk-Tuks in all of Sri Lanka",
                               image: "water",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the seeds in all the watermelons that you had to watch me pluck out over skype <3",
                               image: "watermelon",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: ":)",
                               image: "wedding",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the dance moves. Actually I wantt o dance with you more often <3. I like this photo",
                               image: "weddingdance",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the wedgies anyone has ever had! So many wedgies - so many love!",
                               image: "wedgie",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the krill all the whales have ever eaten!",
                               image: "whale",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...doing anything other than just zom-being with you <3. That's my favorite.",
                               image: "zombeing",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the hunts in all the wilds. It's a dog eat dog world out there - thank goodness we have eachother!",
                               image: "dogs",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...the weight of all the elephant families across all the Earth! Look at those lil babies frolicking d'awwww",
                               image: "elephants2",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the flights I had to take for Nanotronics. I'm happy those hours are behind us!",
                               image: "flights",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the spots on all the leopards on all the continents! I hope you are cat-napping as hard as this guy right now!",
                               image: "leopard",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the times you've blown your nose while at Sardes, plus all the times in the middle of the night <3. It doesn't bother me one bit - It's a genuine happy reminder that I get to sleep next to you! Blow away, love <3",
                               image: "nose",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the Santa justice in Canada! I understand there are entire cities of Santas in Canada",
                               image: "santas",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        next = assembleMessage(caption: "...all the Me Undies adds I've seen on all the webpages on the internet. Click once, and google swears to God you'll never forget about MeUndies for another day in your life.",
                               image: "undies",
                               id: counter)
        counter += 1
        all.append(next)
        
        
        
        let realm = try! Realm(configuration: config)
        
        try! realm.write {
            for eachMessage in all {
                //print(eachMessage)
                realm.add(eachMessage, update: true)
            }
        }
        
        
    }
    
    func assembleMessage(intro: String = "Jacob loves you more than...",
                         caption: String = "",
                         image: String = "",
                         id: Int) -> Message {
        
        let message = Message()
        message.caption = caption
        message.intro = intro
        message.image = image
        message.id = id
        
        
        return message
    }

}


