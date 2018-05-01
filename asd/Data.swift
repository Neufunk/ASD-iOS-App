//
//  Data.swift
//  ASD-iOS-App
//
//  Created by Johnathan Orsolini on 28/04/18.
//  Copyright © 2018 Liblum. All rights reserved.
//
// INDEX - LIBRARIES KEYS //
// Keep that order when populating arrays !
/************
 0 - Namur              15 - Huy
 1 - Philippeville      16 - Verviers
 2 - Ciney              17 - Mouscron
 3 - Gedinne            18 - Comines
 5 - Nivelles           19 - Tournai
 6 - Braine-L-Alleud    20 - Ath
 7 - Jodoigne           21 - Mons
 8 - Bruxelles          22 - Eupen
 9 - Anderlues          23 - Arlon
 10 - Lobbes            24 - Etalle
 11 - Charleroi         25 - Libramont
 12 - LaLouviere        26 - Bastogne
 13 - Liege             27 - Marche
 14 - Aywaille
 ************/

import Foundation
import CoreLocation

class Data {
    
    static var centre: String = "Arlon"
    static var distance: Double = 0
    
    let arrayLocation = [
        "Namur": CLLocation(latitude: 50.4518992, longitude: 4.8725157),
        "Philippeville": CLLocation(latitude: 50.1971293, longitude: 4.5407462),
        "Ciney": CLLocation(latitude: 50.2937976, longitude: 5.0979676),
        "Gedinne": CLLocation(latitude: 49.9804433, longitude: 4.9367074),
        "Nivelles": CLLocation(latitude: 50.5975265, longitude: 4.354365),
        "Braine-L-Alleud": CLLocation(latitude: 50.6836974, longitude: 4.3743161),
        "Jodoigne": CLLocation(latitude: 50.7232823, longitude: 4.8614756),
        "Bruxelles": CLLocation(latitude: 50.8303227, longitude: 4.3712064),
        "Anderlues": CLLocation(latitude: 50.3985898, longitude: 4.2720449),
        "Lobbes": CLLocation(latitude: 50.3487264, longitude: 4.2631334),
        "Charleroi": CLLocation(latitude: 50.4074011, longitude: 4.4428329),
        "LaLouviere": CLLocation(latitude: 50.4743122, longitude: 4.1822657),
        "Liege": CLLocation(latitude: 50.6369286, longitude: 5.5878451),
        "Aywaille": CLLocation(latitude: 50.4732903, longitude: 5.6695691),
        "Huy": CLLocation(latitude: 50.5332759, longitude: 5.2576188),
        "Verviers": CLLocation(latitude: 50.5911361, longitude: 5.8628142),
        "Mouscron": CLLocation(latitude: 50.7410899, longitude: 3.2129236),
        "Comines": CLLocation(latitude: 50.7688331, longitude: 2.9990316),
        "Tournai": CLLocation(latitude: 50.6156622, longitude: 3.4089224),
        "Ath": CLLocation(latitude: 50.6382574, longitude: 3.777425),
        "Mons": CLLocation(latitude: 50.4474363, longitude: 3.9458648),
        "Eupen": CLLocation(latitude: 50.6350943, longitude: 6.0338656),
        "Arlon": CLLocation(latitude: 49.6910105, longitude: 5.8182508),
        "Etalle": CLLocation(latitude: 49.674968, longitude: 5.5538464),
        "Libramont": CLLocation(latitude: 49.9193288, longitude: 5.3803268),
        "Bastogne": CLLocation(latitude: 50.0077429, longitude: 5.7189368),
        "Marche": CLLocation(latitude: 50.2248573, longitude: 5.3410594)
    ]
    
    let arrayAdress = [
        "Namur": "CENTRE DE NAMUR/EGHEZEE \nAvenue de la Dame 93 \n5100 Jambes",
        "Philippeville": "CENTRE DE PHILIPPEVILLE \nRue de l'Arsenal 7 bte 2 \n5600 Philippeville",
        "Ciney": "CENTRE DE DINANT/CINEY \nRue Ed. Dinot 21 \n5590 Ciney",
        "Gedinne": "CENTRE DE GEDINNE \nRue R.Gridlet 8 \n5575 Gedinne",
        "Nivelles": "CENTRE DE NIVELLES \nChaussée de Namur 52c \n1400 Nivelles",
        "Braine-L-Alleud": "CENTRE DE BRAINE-L'ALLEUD \nAvenue Albert 1er 24 \n1420 Braine-L'alleud",
        "Jodoigne": "CENTRE DE JODOIGNE \n Place Major Boine 3 \n1370 Jodoigne",
        "Bruxelles": "CENTRE DE BRUXELLES \nRue Malibran 53 \n1050 Bruxelles",
        "Anderlues": "CENTRE D'ANDERLUES \nRue du Douaire 40/1 \n6150 Anderlues",
        "Lobbes": "CENTRE DE LOBBES \nRue Albert 1er 28 \n6540 Lobbes",
        "Charleroi": "CENTRE DE CHARLEROI \nBoulevard Tirou 163/7 \n6000 Charleroi",
        "LaLouviere": "CENTRE DE LA LOUVIERE \nRue du Marché 2 \n7100 La Louvière",
        "Liege": "CENTRE DE LIEGE \nRue d'Amercoeur 55 \n4020 Liège",
        "Aywaille": "CENTRE D'AYWAILLE \nAvenue de la Répuplique française 11 \n4920 Aywaille",
        "Huy": "CENTRE DE HUY \nRue de la paix 3 \n4500 Tihange (Huy)",
        "Verviers": "CENTRE DE VERVIERS \nRue de la Banque 8 \n4500 Verviers",
        "Mouscron": "CENTRE DE MOUSCRON \nRue Saint-Joseph 8 \n7700 Mouscron",
        "Comines": "CENTRE DE COMINES \nRue de Wervicq 14 \n7780 Comines",
        "Tournai": "CENTRE DE TOURNAI \nChaussée de Renaix 192 \n7500 Tournai",
        "Ath": "CENTRE DE ATH/LESSINES/ENGHIEN \nChemin des Primevères 36 \n7800 Ath",
        "Mons": "CENTRE DE MONS \nRue des canonniers 1 \n7000 Mons",
        "Eupen": "CENTRE D'EUPEN \nAachenerStraße 11-13 \n4700 Eupen",
        "Arlon": "CENTRE D'ARLON \nRue de Rédange 8 \n6700 Arlon",
        "Etalle": "CENTRE D'ETALLE \nRue de la gare 86 \n 6740 Etalle",
        "Libramont": "CENTRE DE LIBRAMONT/BERTRIX \nRue des alliés 2 \n6800 Libramont",
        "Bastogne": "CENTRE DE BASTOGNE \nRue Pierre Thomas 10 \n6600 Bastogne",
        "Marche": "CENTRE DE MARCHE-HOTTON \nAllée du Monument 8A/3 \n6900 Marche-en-Famenne"
    ]
    
    let arrayPhoneNumber = [
        "Namur": "081257457",
        "Philippeville": "071610088",
        "Ciney": "083214108",
        "Gedinne": "061589508",
        "Nivelles": "067893959",
        "Braine-L-Alleud": "023864373",
        "Jodoigne": "010812198",
        "Bruxelles": "026470366",
        "Anderlues": "071599666",
        "Lobbes": "071599666",
        "Charleroi": "071599666",
        "LaLouviere": "071599666",
        "Liege": "043428428",
        "Aywaille": "043428428",
        "Huy": "043428428",
        "Verviers": "087329090",
        "Mouscron": "056859292",
        "Comines": "056555119",
        "Tournai": "069253000",
        "Ath": "068287979",
        "Mons": "065403131",
        "Eupen": "087590780",
        "Arlon": "063230404",
        "Etalle": "063450075",
        "Libramont": "061230410",
        "Bastogne": "061280210",
        "Marche": "084460210"
    ]
    
    let arrayWebsite = [
        "Namur": "http://namur.aideetsoinsadomicile.be/fr",
        "Philippeville": "http://namur.aideetsoinsadomicile.be/fr",
        "Ciney": "http://namur.aideetsoinsadomicile.be/fr",
        "Gedinne": "http://namur.aideetsoinsadomicile.be/fr",
        "Nivelles": "http://brabant.aideetsoinsadomicile.be/fr",
        "Braine-L-Alleud": "http://brabant.aideetsoinsadomicile.be/fr",
        "Jodoigne": "http://brabant.aideetsoinsadomicile.be/fr",
        "Bruxelles": "http://bruxelles.aideetsoinsadomicile.be/fr",
        "Anderlues": "http://hainaut.aideetsoinsadomicile.be/fr",
        "Lobbes": "http://hainaut.aideetsoinsadomicile.be/fr",
        "Charleroi": "http://hainaut.aideetsoinsadomicile.be/fr",
        "LaLouviere": "http://hainaut.aideetsoinsadomicile.be/fr",
        "Liege": "http://liege.aideetsoinsadomicile.be/fr",
        "Aywaille": "http://liege.aideetsoinsadomicile.be/fr",
        "Huy": "http://liege.aideetsoinsadomicile.be/fr",
        "Verviers": "http://verviers.aideetsoinsadomicile.be/fr",
        "Mouscron": "http://mouscron.aideetsoinsadomicile.be/fr",
        "Comines": "http://mouscron.aideetsoinsadomicile.be/fr",
        "Tournai": "http://tournai.aideetsoinsadomicile.be/",
        "Ath": "http://tournai.aideetsoinsadomicile.be/",
        "Mons": "http://mons.aideetsoinsadomicile.be/",
        "Eupen": "http://eupen.aideetsoinsadomicile.be/fr",
        "Arlon": "http://luxembourg.aideetsoinsadomicile.be/fr",
        "Etalle": "http://luxembourg.aideetsoinsadomicile.be/fr",
        "Libramont": "http://luxembourg.aideetsoinsadomicile.be/fr",
        "Bastogne": "http://luxembourg.aideetsoinsadomicile.be/fr",
        "Marche": "http://luxembourg.aideetsoinsadomicile.be/fr"
    ]
    
    let arrayMailAdress = [
        "Namur": "centre.namur@asd-namur.be",
        "Philippeville": "centre.philippeville@asd-namur.be",
        "Ciney": "centre.ciney@asd-namur.be",
        "Gedinne": "centre.gedinne@asd-namur.be",
        "Nivelles": "contact@asdbw.be",
        "Braine-L-Alleud": "contact@asdbw.be",
        "Jodoigne": "contact@asdbw.be",
        "Bruxelles": "info.bxl@fasd.be",
        "Anderlues": "071599666",
        "Lobbes": "071599666",
        "Charleroi": "071599666",
        "LaLouviere": "071599666",
        "Liege": "contact@asdliege.be",
        "Aywaille": "contact@asdliege.be",
        "Huy": "contact@asdliege.be",
        "Verviers": "asd-verviers@asd-verviers.be",
        "Mouscron": "056859292",
        "Comines": "056555119",
        "Tournai": "asd.ath@fasd.be",
        "Ath": "asd.ath@fasd.be",
        "Mons": "065403131",
        "Eupen": "eupen.sekretariat@asd-verviers.be",
        "Arlon": "063230404",
        "Etalle": "063450075",
        "Libramont": "061230410",
        "Bastogne": "061280210",
        "Marche": "084460210"
    ]
}
