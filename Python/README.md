# FareCalc - CityCab Ride Fare Calculator 🚖

## Overview
FareCalc is a backend Python script for CityCab, a ride-sharing startup. It calculates ride fares dynamically based on:
- 📏 **Distance traveled** (in kilometers)
- 🚗 **Vehicle type** (Economy, Premium, SUV)
- ⏰ **Time of booking** (with surge pricing during peak hours)

---

## Features

✨ **Dynamic Pricing Model**
- Base rates per vehicle type: Economy (₹10/km) | Premium (₹18/km) | SUV (₹25/km)
- Automatic 1.5x surge multiplier during peak hours (5 PM - 8 PM)

🛡️ **Robust Error Handling**
- Validates vehicle type availability
- Checks hour input range (0-23)
- Handles invalid user inputs gracefully

📋 **Professional Receipt Output**
- Clear, formatted price receipt
- Shows surge pricing status
- Displays all booking details

---

## How to Use

### Prerequisites
- Python 3.x installed on your system

### Running the Script

1. Open terminal/command prompt in the project directory
2. Run the script:
   ```bash
   python FareCalc.py
   ```

3. Follow the prompts:
   ```
   Enter distance in km: 15
   Enter cab type (Economy / Premium / SUV): Economy
   Enter booking hour (0 to 23): 18
   ```

4. View your fare estimate:
   ```
   ------- Ride Estimate -------
   Distance      : 15.0 km
   Vehicle Type  : Economy
   Rate / km     : ₹ 10
   Booking Hour  : 18
   Surge Pricing : Applied
   Total Fare    : ₹ 225.0
   ```

---

## Pricing Examples

| Distance | Vehicle | Hour | Surge? | Fare |
|----------|---------|------|--------|------|
| 10 km | Economy | 10 AM | ❌ | ₹100 |
| 10 km | Economy | 6 PM | ✅ | ₹150 |
| 20 km | Premium | 3 PM | ❌ | ₹360 |
| 20 km | Premium | 7 PM | ✅ | ₹540 |
| 5 km | SUV | 6 PM | ✅ | ₹187.5 |

---

## Code Structure

```python
rates = {'Economy': 10, 'Premium': 18, 'SUV': 25}  # Price per km

def calculate_fare(km, vehicle_type, hour):
    # Calculates base fare
    # Applies 1.5x surge multiplier if peak hours (17-20)
    # Returns total fare
```

### Peak Hours (Surge Pricing Active)
- **5 PM to 8 PM** (17:00 - 20:00)
- **Multiplier:** 1.5x

---

## Error Handling

The script handles:
- ❌ Invalid vehicle types → "Service Not Available"
- ❌ Invalid hours (not 0-23) → "Invalid hour" warning
- ❌ Non-numeric inputs → "Invalid input" error message

---

## Business Analytics

**Peak Hour Revenue Boost:** The 1.5x multiplier during 5-8 PM helps:
- Maximize earnings during high-demand periods
- Incentivize driver availability during rush hours
- Improve customer service capacity management

---

## Future Enhancements

Possible additions:
- 🎟️ Discount codes & promotional pricing
- 📊 Multiple rides & package deals
- 🌧️ Weather-based dynamic pricing
- 📱 Ride history & receipt storage
- 🗺️ Distance estimation from coordinates

---

## Author
**Student Project** - Virtusa Mini Projects
- Demonstrates: Python dictionaries, functions, conditionals, error handling
- Use Case: Real-world ride-sharing backend logic

---

## License
This project is for educational purposes.
