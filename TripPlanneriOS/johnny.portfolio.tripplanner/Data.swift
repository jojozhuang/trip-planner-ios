//
//  Data.swift
//  johnny.portfolio.tripplanner
//
//  Created by Johnny on 5/14/15.
//  Copyright (c) 2015 JoJoStudio. All rights reserved.
//

import Foundation
import UIKit

//Global app settings
var appSettings = AppSettings()

class AppSettings {
    var onlyDownloadDataInWifiMode: Bool = false
    var transitionOptions = UIViewAnimationOptions.transitionCurlUp
    init(){
    }
    
    init(onlyDownloadDataInWifiMode: Bool) {
        self.onlyDownloadDataInWifiMode = onlyDownloadDataInWifiMode
    }
}

//Trips
var sights1: [String] = ["Cloud Gate", "Shedd Aquarium", "Skydeck", "Field Museum", "Adler Planetarium"]
var sights2: [String] = ["Yu Garden", "Oriental Pearl Tower", "Shanghai French Consession", "Xin Tian Di", "Longhua Temple"]
var sights3: [String] = ["Port Jackson", "Sydney Harbour Bridge", "Bondi Beach", "Taronga Zoo", "Sea Life Aquarium"]
var sights4: [String] = ["London Eye", "Buckingham Palace", "British Museum", "Tower Bridge", "St Paul's Cathedral"]

var trips = [
    Trip(destination: "Chicago", country: "USA", from: convertDate(datestr: "2015 Jul 26 08:00 AM"), to: convertDate(datestr: "2015 Jul 30 06:55 PM"), flight1: "AA999", flight2: "AA130", hotel: "Hilton Chicago O'Hare Airport",sights: sights1, note: "For a economy forum."),
    Trip(destination: "Shanghai", country: "China", from: convertDate(datestr: "2015 Aug 22 09:01 AM"), to: convertDate(datestr: "2015 Sep 13 04:03 PM"), flight1: "AA289", flight2: "AA288", hotel: "Four Seasons Hotel",sights: sights2, note: "For short business travel."),
    Trip(destination: "Sydney", country: "Australia", from: convertDate(datestr: "2015 Sep 29 09:01 AM"), to: convertDate(datestr: "2015 Oct 28 10:03 PM"), flight1: "AA7364", flight2: "AA7363", hotel: "Hilton Sydney",sights: sights3, note: "For a personal trip to Golden Beach with family."),
    Trip(destination: "London", country: "United Kingdom", from: convertDate(datestr: "2015 Nov 8 09:35 AM"), to: convertDate(datestr: "2015 Dec 25 08:01 PM"), flight1: "AA928", flight2: "AA929", hotel: "London Hilton on Park Lane",sights: sights4, note: "Visit a customer, will be work onsite for a couple of days."),
    Trip(destination: "Hangzhou", country: "China", from: convertDate(datestr: "2015 Dec 28 09:35 AM"), to: convertDate(datestr: "2015 Dec 30 08:01 PM"), flight1: "AA928", flight2: "AA929", hotel: "London Hilton on Park Lane",sights: sights4, note: "Visit a customer, will be work onsite for a couple of days."),
    Trip(destination: "LosAngeles", country: "USA", from: convertDate(datestr: "2016 Jan 1 09:35 AM"), to: convertDate(datestr: "2016 Jan 15 08:01 PM"), flight1: "AA928", flight2: "AA929", hotel: "London Hilton on Park Lane",sights: sights4, note: "Visit a customer, will be work onsite for a couple of days."),
    Trip(destination: "NewYork", country: "USA", from: convertDate(datestr: "2016 Feb 1 09:35 AM"), to: convertDate(datestr: "2016 Feb 7 08:01 PM"), flight1: "AA928", flight2: "AA929", hotel: "London Hilton on Park Lane",sights: sights4, note: "Visit a customer, will be work onsite for a couple of days."),
    Trip(destination: "Beijing", country: "China", from: convertDate(datestr: "2016 Mar 8 09:35 AM"), to: convertDate(datestr: "2016 Mar 25 08:01 PM"), flight1: "AA928", flight2: "AA929", hotel: "London Hilton on Park Lane",sights: sights4, note: "Visit a customer, will be work onsite for a couple of days."),
]

class Trip {
    var destination: String = ""
    var country: String = ""
    var from = NSDate()
    var to = NSDate()
    var flight1: String = ""
    var flight2: String = ""
    var hotel: String = ""
    var sights: [String] = ["","","","",""]
    var note: String = ""
    
    init() {
    }

    init(destination: String, country: String, from: NSDate, to: NSDate, flight1: String, flight2: String, hotel:String, sights:[String], note: String) {
        self.destination = destination
        self.country = country
        self.from = from
        self.to = to
        self.flight1 = flight1
        self.flight2 = flight2
        self.hotel = hotel
        self.sights = sights
        self.note = note
    }
}

func addNewTrip(trip: Trip) {
    trips.insert(trip, at: 0)
}

func getNextTrip() ->Trip? {
    if trips.count > 0 {
        trips.sort(by: {$0.from.compare($1.from as Date) == ComparisonResult.orderedAscending })
        let trip = trips[0]
        return trip
    }
    else {
        return nil
    }
}

//Continents, image size: 80x80
var continents = [
    Continent(key: "C1", name: "Asia", locations: 8, image: "Asia"),
    Continent(key: "C2", name: "Europe", locations: 1, image: "Europe"),
    Continent(key: "C3", name: "Oceania", locations: 1, image: "Oceania"),
    Continent(key: "C4", name: "Africa", locations: 0, image: "Africa"),
    Continent(key: "C5", name: "North America", locations: 4, image: "NorthAmerica"),
    Continent(key: "C6", name: "South America", locations: 0, image: "SouthAmerica"),
    Continent(key: "C7", name: "Antarctica", locations: 0, image: "Antarctica"),
]

class Continent {
    var key: String = ""
    var name: String = ""
    var locations: Int = 0
    var image: String = ""
    
    init () {
        
    }

    init(key: String, name: String, locations: Int, image: String) {
        self.key = key
        self.name = name
        self.locations = locations
        self.image = image
    }
}

//Countries, image size: 300x300
var countries = [
    //Asia
    Country(continent: "C1", key: "CNTY11", name: "China", locations: 5, image: "China"),
    Country(continent: "C1", key: "CNTY12", name: "Japan", locations: 0, image: "Japan"),
    Country(continent: "C1", key: "CNTY13", name: "South Korea", locations: 0, image: "SouthKorea"),
    Country(continent: "C1", key: "CNTY14", name: "Singapore", locations: 0, image: "Singapore"),
    Country(continent: "C1", key: "CNTY15", name: "Thailand", locations: 0, image: "Thailand"),
    Country(continent: "C1", key: "CNTY16", name: "India", locations: 0, image: "India"),
    Country(continent: "C1", key: "CNTY17", name: "Mongolia", locations: 0, image: "Mongolia"),
    Country(continent: "C1", key: "CNTY18", name: "Saudi Arabia", locations: 0, image: "SaudiArabia"),
    
    //Europe
    Country(continent: "C2", key: "CNTY21", name: "United Kingdom", locations: 1, image: "UnitedKingdom"),
    
    //Oceania
    Country(continent: "C3", key: "CNTY31", name: "Australia", locations: 1, image: "Australia"),
    
    //North America
    Country(continent: "C5", key: "CNTY51", name: "United States", locations: 5, image: "UnitedStates"),
    Country(continent: "C5", key: "CNTY52", name: "Canada", locations: 0, image: "Canada"),
    Country(continent: "C5", key: "CNTY53", name: "Mexico", locations: 0, image: "Mexico"),
    Country(continent: "C5", key: "CNTY54", name: "Cuba", locations: 0, image: "Cuba"),
]

class Country {
    var continent: String = ""
    var key: String = ""
    var name: String = ""
    var locations: Int = 0
    var image: String = ""
    
    init () {
        
    }
    
    init(continent: String, key: String, name: String, locations: Int, image: String) {
        self.continent = continent
        self.key = key
        self.name = name
        self.locations = locations
        self.image = image
    }
}

func getCountryList(continent: String) -> Array<Country> {
    if continent.isEmpty {
        return Array()
    }
    else {
        var list = Array<Country>()
        for country in countries {
            if country.continent == continent {
                list.append(country)
            }
        }
        return list
    }
}

//Cities
var pointsofinterest1: [String] = ["YuyuanGarden", "TheBund", "PeoplesSquare", "OrientalPearlTower", "Lujiazui"]
var pointsofinterest2: [String] = ["CloudGate", "SheddAquarium", "Skydeck", "FieldMuseum", "AdlerPlanetarium"]
//cities, image size: 300x300
var cities = [
    //China
    City(country: "CNTY11", key:"CITY111", name: "Shanghai", image: "Shanghai", latitude: 31.2000, longitude: 121.5000, area: "2,448 mi² (6,340 km²)", founded: "1291", localtime: "Sunday 3:18 AM", weather: "70°F (21°C), 83% Humidity", population: "14.35 million (2000)", title: "City in China", description: "Enormous Shanghai, on China’s central coast, is the country's biggest city and a global financial hub. Its heart is the Bund, a famed waterfront promenade lined with colonial-era buildings. Across the Huangpu River rises Pudong’s futuristic skyline, including 632m Shanghai Tower and the Oriental Pearl TV Tower, with distinctive pink spheres. Sprawling Yuyuan Garden has traditional pavilions, towers and ponds.", pointsofinterest: pointsofinterest1),
    City(country: "CNTY11", key:"CITY112", name: "Beijing", image: "Beijing", latitude: 39.9167, longitude: 116.3833, area: "6,487 mi² (16,801 km²)", founded: "907", localtime: "Sunday 3:18 AM", weather: "68°F (20°C), 68% Humidity", population: "11.51 million (2000)", title: "Capital of China", description: "Beijing, China’s massive capital, has history stretching back 3 millennia. Yet it’s known as much for its modern architecture as its ancient sites such as the grand Forbidden City complex, the imperial palace during the Ming and Qing dynasties. Nearby, the massive Tiananmen Square pedestrian plaza is site of Mao Zedong’s mausoleum and the National Museum of China, displaying a vast collection of cultural relics.", pointsofinterest: pointsofinterest2),
    City(country: "CNTY11", key:"CITY113", name: "Hangzhou", image: "Hangzhou", latitude: 30.2500, longitude: 120.1667, area: "5,362 mi² (13,887 km²)", founded: "220BC", localtime: "Sunday 3:18 AM", weather: "70°F (21°C), 78% Humidity", population: "2.451 million (2000)", title: "City in China", description: "Hangzhou, the capital of China’s Zhejiang province, is known as the southern terminus of the ancient Grand Canal waterway, originating in Beijing. Its West Lake, celebrated by poets and artists since the 9th century, encompasses islands (reachable by boat), temples, pavilions, gardens and arched bridges. On its south bank is 5-story Leifeng Pagoda, a modern reconstruction of a structure built in 975 C.E.", pointsofinterest: pointsofinterest2),
    City(country: "CNTY11", key:"CITY114", name: "Sanya", image: "Sanya", latitude: 18.2533, longitude: 109.5036, area: "740 mi² (1,919 km²)", founded: "1905", localtime: "Sunday 3:18 AM", weather: "84°F (29°C), 89% Humidity", population: "482,296 (2000)", title: "City in China", description: "Sanya, a city on the southern end of China’s Hainan Island, has several bays with large beach resorts. Yalong Bay is known for upscale hotels, while Wuzhizhou Island and its coral reefs are destinations for scuba diving, surfing and other water sports. At the city's expansive Nanshan Temple complex, a 108m-high Guan Yin bronze statue rises on a man-made island.", pointsofinterest: pointsofinterest2),
    City(country: "CNTY11", key:"CITY115", name: "Lhasa", image: "Lhasa", latitude: 29.6500, longitude: 91.1167, area: "11,396 mi² (29,518 km²)", founded: "633", localtime: "Sunday 3:18 AM", weather: "51°F (11°C), 50% Humidity", population: "223,001 (2000)", title: "City in China", description: "Lhasa, the capital of the Tibet Autonomous Region, lies on the Lhasa River's north bank in a valley of the Himalaya Mountains. Rising atop Red Mountain at an altitude of 3,700m, the red-and-white Potala Palace once served as the winter home of the Dalai Lama. The palace’s rooms, numbering nearly 1,000, include the Dalai Lama’s living quarters, murals, chapels and tombs.", pointsofinterest: pointsofinterest2),

    //United Kindom
    City(country: "CNTY21", key:"CITY211", name: "London", image: "London", latitude: 51.5072, longitude: -0.1275, area: "607 mi² (1,572 km²)", founded: "BC", localtime: "Tuesday 4:50 PM", weather: "66°F (19°C), 42% Humidity", population: "8.000 million (2010)", title: "Capital of England", description: "London, England’s capital, set on the River Thames, is a 21st-century city with history stretching back to Roman times. At its centre stand the imposing Houses of Parliament, the iconic ‘Big Ben’ clock tower and Westminster Abbey, site of British monarch coronations. Across the Thames, the London Eye observation wheel provides panoramic views of the South Bank cultural complex, and the entire city.", pointsofinterest: pointsofinterest2),
    
    //Sydney
    City(country: "CNTY31", key:"CITY311", name: "Sydney", image: "Sydney", latitude: -33.8650, longitude: 151.2094, area: "4,689 mi² (12,145 km²)", founded: "1796", localtime: "Wednesday 1:55 AM", weather: "55°F (13°C), 77% Humidity", population: "4.576 million (2010)", title: "City in New South Wales, Australia", description: "Sydney, capital of New South Wales and one of Australia's largest cities, is best known for its harbourfront Opera House, with a distinctive sail-like design. Massive Darling Harbour and Circular Quay are hubs of waterside life, with the towering, arched Harbour Bridge and esteemed Royal Botanic Gardens nearby. Sydney Tower’s 268m glass viewing platform, the Skywalk, offers 360-degree views of the city, harbour and suburbs.", pointsofinterest: pointsofinterest2),

    //United States
    City(country: "CNTY51", key:"CITY511", name: "Chicago", image: "Chicago", latitude: 41.8369, longitude: -87.6847, area: "233 mi² (606 km²)", founded: "1837", localtime: "Saturday 2:47 PM", weather: "77°F (25°C), 28% Humidity", population: "2.719 million (2013)", title: "City in Illinois", description: "Chicago, on Lake Michigan in Illinois, is among the largest cities in the U.S. Famed for its bold architecture, it has a skyline bristling with skyscrapers such as the iconic John Hancock Center, sleek, 1,451-ft. Willis Tower and neo-Gothic Tribune Tower. The city is also renowned for its museums, including the Art Institute and its expansive collections, including noted Impressionist works.", pointsofinterest: pointsofinterest2),
    City(country: "CNTY51", key:"CITY512", name: "Honolulu", image: "Honolulu", latitude: 21.3000, longitude: -157.8167, area: "68.42 mi² (177.2 km²)", founded: "1778", localtime: "Saturday 9:52 AM", weather: "78°F (26°C), 54% Humidity", population: "374,658 (2009)", title: "City in Hawaii", description: "Honolulu, on Oahu’s south shore, is capital of Hawaii, and gateway to the U.S. island chain. The Waikiki neighborhood is its center for dining, nightlife and shopping, famed for its iconic crescent beach backed by palms and high-rise hotels, with volcanic Diamond Head looming in the distance. Sites relating to the World War II attack on Pearl Harbor include the USS Arizona Memorial.", pointsofinterest: pointsofinterest2),
    City(country: "CNTY51", key:"CITY513", name: "Los Angeles", image: "LosAngeles", latitude: 34.0500, longitude: -118.2500, area: "498 mi² (1,290 km²)", founded: "1781", localtime: "Saturday 12:55 PM", weather: "68°F (20°C), 53% Humidity", population: "3.884 million (2013)", title: "City in California", description: "Los Angeles is a sprawling Southern California city famed as the center of the nation’s film and television industry. Not far from its iconic Hollywood sign, studios such as Paramount Pictures, Universal and Warner Brothers offer behind-the-scenes tours. On Hollywood Boulevard, TCL Chinese Theater displays celebrities’ hand- and footprints, the Walk of Fame honors thousands of luminaries and vendors sell maps to stars’ homes.", pointsofinterest: pointsofinterest2),
    City(country: "CNTY51", key:"CITY514", name: "New York", image: "NewYork", latitude: 40.7127, longitude: -74.0059, area: "469 mi² (1,214 km²)", founded: "1492", localtime: "Saturday 4:00 PM", weather: "67°F (19°C), 21% Humidity", population: "8.406 million (2013)", title: "New York City", description: "Home to the Empire State Building, Times Square, Statue of Liberty and other iconic sites, New York City is a fast-paced, globally influential center of art, culture, fashion and finance. The city’s 5 boroughs sit where the Hudson River meets the Atlantic Ocean, with the island borough of Manhattan at the \"Big Apple's\" core.", pointsofinterest: pointsofinterest2),
    City(country: "CNTY51", key:"CITY515", name: "Las Vegas", image: "LasVegas", latitude:36.1215, longitude: -115.1739, area: "131 mi² (340 km²)", founded: "1905", localtime: "Saturday 1:03 PM", weather: "76°F (24°C), 27% Humidity", population: "603,488 (2013)", title: "City in Nevada", description: "Las Vegas, in Nevada’s Mojave Desert, is a resort town famed for its buzzing energy, 24-hour casinos and endless entertainment options. Its focal point is the Strip, just over 4 miles long and lined with elaborate theme hotels such as the pyramid-shaped Luxor and the Venetian, complete with Grand Canal; luxury resorts including the Bellagio, set behind iconic dancing fountains; and innumerable casinos.", pointsofinterest: pointsofinterest2),
]

class City {
    var country: String = ""
    var key: String = ""
    var name: String = ""
    var image: String = ""
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    var area: String = ""
    var founded: String = ""
    var localtime: String = ""
    var weather: String = ""
    var population: String = ""
    var title: String = ""
    var description: String = ""
    var pointsofinterest: [String] = ["","","","",""]
    
    init () {
        
    }
    
    init(country: String, key: String, name: String, image: String, latitude: Double, longitude: Double, area: String, founded: String, localtime: String, weather: String, population: String, title: String, description: String, pointsofinterest:[String]) {
        self.country = country
        self.key = key
        self.name = name
        self.image = image
        self.latitude = latitude
        self.longitude = longitude
        self.area = area
        self.founded = founded
        self.localtime = localtime
        self.weather = weather
        self.population = population
        self.title = title
        self.description = description
        self.pointsofinterest = pointsofinterest
    }
}

func getCityList(country: String) -> Array<City> {
    if country.isEmpty {
        return Array()
    }
    else {
        var list = Array<City>()
        for city in cities {
            if city.country == country {
                list.append(city)
            }
        }
        return list
    }
}

//TimeZone
var localTimeZones = [
    LocalTimeZone(city: "CITY111", timezone: "Asia/Shanghai"),
    LocalTimeZone(city: "CITY112", timezone: "Asia/Beijing"),
    LocalTimeZone(city: "CITY113", timezone: "Asia/Shanghai"),
    LocalTimeZone(city: "CITY114", timezone: "Asia/Shanghai"),
    LocalTimeZone(city: "CITY115", timezone: "Asia/Shanghai"),
    LocalTimeZone(city: "CITY211", timezone: "Europe/London"),
    LocalTimeZone(city: "CITY311", timezone: ""),
    LocalTimeZone(city: "CITY511", timezone: "America/Chicago"),
    LocalTimeZone(city: "CITY512", timezone: ""),
    LocalTimeZone(city: "CITY513", timezone: ""),
    LocalTimeZone(city: "CITY514", timezone: ""),
    LocalTimeZone(city: "CITY515", timezone: ""),
]

class LocalTimeZone {
    var city: String = ""
    var timezone: String = ""
    
    init () {
        
    }
    
    init(city: String, timezone: String) {
        self.city = city
        self.timezone = timezone
    }
}

//Favorites
var favorites = [
    Favorite(city: "CITY111", addedtime: convertDate(datestr: "2015 May 26 08:00 AM")),
    Favorite(city: "CITY511", addedtime: convertDate(datestr: "2015 May 22 08:00 AM")),
    Favorite(city: "CITY311", addedtime: convertDate(datestr: "2015 May 21 08:00 AM")),
    Favorite(city: "CITY112", addedtime: convertDate(datestr:"2015 May 12 08:00 AM")),
    Favorite(city: "CITY115", addedtime: convertDate(datestr:"2015 May 11 08:00 AM")),
    Favorite(city: "CITY211", addedtime: convertDate(datestr:"2015 May 09 08:00 AM")),
    Favorite(city: "CITY513", addedtime: convertDate(datestr:"2015 May 08 08:00 AM")),
    Favorite(city: "CITY514", addedtime: convertDate(datestr:"2015 May 07 08:00 AM")),
    Favorite(city: "CITY515", addedtime: convertDate(datestr:"2015 May 06 08:00 AM")),
]

class Favorite {
    var city: String = ""
    var addedtime = NSDate()
    
    init () {
        
    }
    
    init(city: String, addedtime: NSDate) {
        self.city = city
        self.addedtime = addedtime
    }
}

func sortFavorites() {
    if favorites.count > 0 {
        favorites.sort(by: {$0.addedtime.compare($1.addedtime as Date) == ComparisonResult.orderedDescending })
    }
}

func getFavoriteCityList() -> Array<City> {
    if favorites.count == 0 {
        return Array()
    }
    else {
        var list = Array<City>()
        sortFavorites()
        for favorite in favorites {
            for city in cities {
                if city.key == favorite.city {
                    list.append(city)
                    break
                }
            }
        }
        return list
    }
}

func checkFavorite(key: String) ->Bool {
    if key.isEmpty {
        return false
    }
    else {
        for favorite in favorites {
            if favorite.city == key {
                return true
            }
        }
        return false
    }
}

func addNewFavorite(key: String) {
    let newfavorite = Favorite(city: key, addedtime: NSDate())
    favorites.insert(newfavorite, at: 0)
}

func removeFavorite(key: String) {
    if key.isEmpty {
        return
    }
    else {
        var index = 0;
        for favorite in favorites {
            if favorite.city == key {
                favorites.remove(at: index)
                return
            }
            index += 1
        }
    }
}
