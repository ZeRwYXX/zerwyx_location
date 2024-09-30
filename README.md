# Images

## Notify
![image](https://github.com/user-attachments/assets/b95cef43-f4f6-4163-8586-80b5f87e6495)

## Menu
![image](https://github.com/user-attachments/assets/12236012-2347-4120-afac-7a5f3b45a2f0)



# Vehicle Rental Script

This script provides an in-game vehicle rental system with NPC interactions, customizable blips, vehicle listings, and multi-language support.

## Features
- Rent vehicles via NPCs.
- Customizable blips on the map for vehicle rental locations.
- Multi-language support (English and French by default).
- Easy configuration through the `config.lua` file.

## Requirements
- ESX Framework
- `ox_target` for NPC targeting
- `ak47_vehiclekeys` for vehicle key integration (ensure this is included if you want key functionality)

## Installation
1. Download or clone this repository into your `resources` folder.
2. Ensure you have the required dependencies installed.
3. Add `start zerwyx_location` to your `server.cfg` to start the resource.

## Configuration
The script provides a variety of options that you can customize to fit your server’s needs. All configuration options are found in the `config.lua` file.

### `config.lua` Options

### 1. **Language Settings**

- **`Config.Locales`**:
  - Defines the default language for the script.
  - Options: `"en"` for English or `"fr"` for French.
  
```lua
Config.Locales = "en"
```

### 2. **Ped Configuration**

- **`Config.Ped`**:
  - The ped model used for the vehicle rental NPCs.
  - Default: `"s_m_m_security_01"`

```lua
Config.Ped = "s_m_m_security_01"
```

- **`Config.PedLocations`**:
  - Defines the positions where the NPCs will spawn along with the vehicle spawn locations.
  
```lua
Config.PedLocations = {
    {coords = vector4(418.7867, -1886.876, 25.21788, 87.18652), spawnVehicle = vector4(412.2418, -1893.087, 25.83743, 52.44023)}, 
    {coords = vector4(212.4296, -808.6539, 30.81399, 70.78458), spawnVehicle = vector4(219.1842, -809.3712, 30.68375, 242.0458)}, 
}
```

- `coords`: The position where the NPC will spawn.
- `spawnVehicle`: The position where the rented vehicle will spawn.

### 3. **Blip Configuration**

- **`Config.BlipSettings`**:
  - Customize the map blip for the vehicle rental location.

```lua
Config.BlipSettings = {
    sprite = 225,       -- ID of the blip icon (default: vehicle icon)
    color = 3,          -- Color of the blip (default: light blue)
    scale = 0.8,        -- Size of the blip
    display = 4,        -- Display setting on the minimap
    text = "Vehicle Rental" -- Text shown when you hover over the blip
}
```
- **`sprite`**: Icon ID for the blip.
- **`color`**: The color ID for the blip.
- **`scale`**: The size of the blip icon.
- **`display`**: How the blip appears on the map (4 is standard).
- **`text`**: The label shown for the blip.

### 4. **Vehicle List Configuration**

- **`Config.VehicleList`**:
  - A list of vehicles available for rent with their details.

```lua
Config.VehicleList = {
    {model = "panto", price = 500, img = "img/panto.png"},
    {model = "brioso", price = 800, img = "img/brioso.png"},
    {model = "bmx", price = 80, img = "img/bmx.png"},
    {model = "blista", price = 400, img = "img/blista.png"},
    {model = "faggio", price = 250, img = "img/faggio.png"},
}
```
- `model`: The vehicle's spawn name.
- `price`: The rental cost for the vehicle.
- `img`: The path to the image displayed in the menu.

### 5. **Category Configuration**

- **`Config.Category`**:
  - Allows you to categorize the vehicles displayed in the rental menu.

```lua
Config.Category = {
    {name = "voiture", label = "Car Category", icon = "fas fa-car"},
    {name = "bicycle", label = "Bicycle Category", icon = "fa-solid fa-bicycle"},
}
```
- `name`: The internal category name.
- `label`: Displayed name of the category.
- `icon`: Font Awesome icon class for the category.

### 6. **Payment Configuration**

- **`Config.PaymentType`**:
  - Defines how the player pays for the rental.
  - Options: `"bank"` or `"money"`.

```lua
Config.PaymentType = "bank"
```

### 7. **Translations Configuration**

- **`Config.Translations`**:
  - Contains all text strings for the script in different languages.

```lua
Config.Translations = {
    ['fr'] = {
        ['rent_vehicle'] = "Louer un véhicule",
        ['menu_title'] = "Location de Véhicules",
        ['rent_button'] = "Louer",
        ['close_button'] = "Fermer",
    },
    ['en'] = {
        ['rent_vehicle'] = "Rent a vehicle",
        ['menu_title'] = "Vehicle Rental",
        ['rent_button'] = "Rent",
        ['close_button'] = "Close",
    }
}
```
- Update this section if you want to customize or add more languages.

## How to Change the Language
1. Open `config.lua`.
2. Change the `Config.Locales` value to `"en"` for English or `"fr"` for French:
   ```lua
   Config.Locales = "en" -- Change to "fr" for French
   ```

## How to Add New Vehicles
1. Add new entries to the `Config.VehicleList`:
   ```lua
   {model = "sultan", price = 600, img = "img/sultan.png"},
   ```

## How to Add New Rental Locations
1. Add new entries to `Config.PedLocations` with the desired coordinates and spawn positions:
   ```lua
   {coords = vector4(x, y, z, heading), spawnVehicle = vector4(x, y, z, heading)},
   ```

## How to Customize the Blip
1. Adjust the settings in `Config.BlipSettings`:
   - Change `sprite`, `color`, `scale`, `display`, and `text` to your liking.

## Troubleshooting
- Ensure you have the required dependencies installed (`es_extended`, `ox_target`).
- If blips or NPCs are not showing up, check your configuration for any errors or missing data.
- Verify that your `fxmanifest.lua` includes the necessary files.

## Support
For any issues or questions, feel free to contact us or open an issue on the repository.

Enjoy your vehicle rental experience!
