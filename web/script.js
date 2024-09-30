let translations = {}; 
let spawnLocation = {}; 

async function loadTranslations(lang) {
    try {
        const response = await fetch(`../locales/${lang}.json`);
        if (!response.ok) {
            throw new Error(`Erreur de chargement du fichier JSON: ${response.status}`);
        }
        translations = await response.json();
        console.log("Traductions chargées:", translations);

        document.getElementById("menuTitle").textContent = translations.menu_title || "Location de Véhicules";
        document.querySelector(".close-button").innerHTML = `<i class="fas fa-times"></i> ${translations.close_button || 'Close'}`;
        document.title = translations.menu_title || "Location de Véhicules"; 
    } catch (error) {
        console.error(`Erreur lors du chargement des traductions pour la langue: ${lang}`, error);
    }
}

const htmlLang = document.documentElement.lang || "fr";
loadTranslations(htmlLang);

window.addEventListener("message", (event) => {
    if (event.data.action === "openMenu") {
        translations = event.data.translations; 
        spawnLocation = event.data.spawnLocation; 
        displayMenu(event.data.vehicles);
    } else if (event.data.action === "closeMenu") {
        document.getElementById("rentalMenu").classList.add("hidden");
    } else if (event.data.action === "showNotification") {
        showNotification(event.data.type, event.data.message);
    }
});

function displayMenu(vehicles) {
    const vehicleList = document.getElementById("vehicleList");
    vehicleList.innerHTML = ""; 

    vehicles.forEach((vehicle, index) => {
        const vehicleDiv = document.createElement("div");
        vehicleDiv.classList.add("vehicle");

        const img = document.createElement("img");
        img.src = vehicle.img;
        vehicleDiv.appendChild(img);

        const name = document.createElement("span");
        name.textContent = `${vehicle.model} - $${vehicle.price}`;
        vehicleDiv.appendChild(name);

        const button = document.createElement("button");
        button.innerHTML = `<i class="fas fa-car"></i> ${translations.rent_button || 'Louer'}`;
        button.onclick = () => rentVehicle(index);
        vehicleDiv.appendChild(button);

        vehicleList.appendChild(vehicleDiv);
    });

    document.querySelector(".close-button").innerHTML = `<i class="fas fa-times"></i> ${translations.close_button || 'Close'}`;
    document.getElementById("rentalMenu").classList.remove("hidden");
}

function rentVehicle(index) {
    fetch(`https://${GetParentResourceName()}/rentVehicle`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ index: index, spawnLocation }), 
    });
}

function showNotification(type, message) {
    const container = document.getElementById("notificationContainer");

    const notification = document.createElement("div");
    notification.classList.add("notification", type);

    const icon = document.createElement("i");
    icon.classList.add("notification-icon");

    switch (type) {
        case "success":
            icon.classList.add("fas", "fa-check-circle");
            break;
        case "error":
            icon.classList.add("fas", "fa-times-circle");
            break;
        case "warning":
            icon.classList.add("fas", "fa-exclamation-triangle");
            break;
        case "info":
            icon.classList.add("fas", "fa-info-circle");
            break;
        default:
            icon.classList.add("fas", "fa-info-circle");
    }

    const messageElement = document.createElement("span");
    messageElement.classList.add("notification-message");
    messageElement.textContent = message;

    notification.appendChild(icon);
    notification.appendChild(messageElement);
    container.appendChild(notification);

    setTimeout(() => {
        notification.classList.add("hidden");
        setTimeout(() => {
            container.removeChild(notification);
        }, 300);
    }, 5000);
}

function closeMenu() {
    document.getElementById("rentalMenu").classList.add("hidden");
    fetch(`https://${GetParentResourceName()}/closeMenu`, {
        method: "POST",
    });
}
