Config = {}

Config.Locales = "en" 

Config.VehicleList = {
    {model = "panto", price = 500, img = "img/panto.png"},
    {model = "brioso", price = 800, img = "img/brioso.png"},
    {model = "bmx", price = 80, img = "img/bmx.png"},
    {model = "blista", price = 400, img = "img/blista.png"},
    {model = "faggio", price = 250, img = "img/faggio.png"},
}


Config.BlipSettings = {
    sprite = 225,       
    color = 3,          
    scale = 0.5,       
    display = 4,       
    text = "Location de Véhicules" 
}


Config.PedLocations = {
    {coords = vector4(418.7867, -1886.876, 25.21788, 87.18652), spawnVehicle = vector4(412.2418, -1893.087, 25.83743, 52.44023)}, 
    {coords = vector4(212.4296, -808.6539, 30.81399, 70.78458), spawnVehicle = vector4(219.1842, -809.3712, 30.68375, 242.0458)}, 
}

Config.Category = {
    {name = "voiture", label = "Catégory Voitures", icon = "fas fa-car"},
    {name = "voiture", label = "Catégory Voitures", icon = "fa-solid fa-bicycle"},
}

Config.Ped = "a_m_m_bevhills_02"

Config.PaymentType = "bank" -- "bank" or "money"



Config.Translations = {
    ['fr'] = {
        ['rent_vehicle'] = "Louer un véhicule",
        ['error_missing_info'] = "Erreur : Les informations du véhicule sélectionné sont manquantes.",
        ['vehicle_spawn_error'] = "Erreur : Impossible de charger le modèle du véhicule.",
        ['category'] = "Catégorie : %s",
        ['success_payment'] = "Vous avez payé $%s depuis votre compte bancaire.",
        ['insufficient_funds'] = "Vous n'avez pas assez d'argent sur votre compte bancaire.",
        ['cash_payment'] = "Vous avez payé $%s en espèces.",
        ['cash_insufficient'] = "Vous n'avez pas assez d'argent liquide.",
        ['bank_success'] = "Vous avez payé $%s depuis votre compte bancaire.",
        ['bank_error'] = "Vous n'avez pas assez d'argent sur votre compte bancaire.",
        ['cash_success'] = "Vous avez payé $%s en espèces.",
        ['cash_error'] = "Vous n'avez pas assez d'argent liquide.",
        ['menu_title'] = "Location de Véhicules",
        ['rent_button'] = "Louer",
        ['close_button'] = "Fermer",
        ['notification_success'] = "Succès",
        ['notification_error'] = "Erreur",
    },
    ['en'] = {
        ['rent_vehicle'] = "Rent a vehicle",
        ['error_missing_info'] = "Error: The selected vehicle information is missing.",
        ['vehicle_spawn_error'] = "Error: Unable to load the vehicle model.",
        ['category'] = "Category: %s",
        ['success_payment'] = "You paid $%s from your bank account.",
        ['insufficient_funds'] = "You do not have enough money in your bank account.",
        ['cash_payment'] = "You paid $%s in cash.",
        ['cash_insufficient'] = "You do not have enough cash.",
        ['bank_success'] = "You paid $%s from your bank account.",
        ['bank_error'] = "You do not have enough money in your bank account.",
        ['cash_success'] = "You paid $%s in cash.",
        ['cash_error'] = "You do not have enough cash.",
    }
}