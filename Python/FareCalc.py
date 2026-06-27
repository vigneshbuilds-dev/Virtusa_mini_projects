# FareCalc - Simple Cab Fare Calculator

rates = {
    "Economy": 10,
    "Premium": 18,
    "SUV": 25
}


def calculate_fare(km, vehicle_type, hour):
    fare = km * rates[vehicle_type]

    # Surge pricing during peak hours
    if 17 <= hour <= 20:
        fare = fare * 1.5

    return fare


print("================================")
print("      Welcome to CityCab        ")
print("================================")

try:
    km = float(input("Enter distance in km: "))
    vehicle_type = input("Enter cab type (Economy / Premium / SUV): ").title()
    hour = int(input("Enter booking hour (0 to 23): "))

    if vehicle_type not in rates:
        print("Service Not Available")
    elif hour < 0 or hour > 23:
        print("Invalid hour. Please enter between 0 and 23.")
    else:
        total = calculate_fare(km, vehicle_type, hour)

        print("\n------- Ride Estimate -------")
        print("Distance      :", km, "km")
        print("Vehicle Type  :", vehicle_type)
        print("Rate / km     : ₹", rates[vehicle_type])
        print("Booking Hour  :", hour)

        if 17 <= hour <= 20:
            print("Surge Pricing : Applied")
        else:
            print("Surge Pricing : Not Applied")

        print("Total Fare    : ₹", round(total, 2))
        print("-----------------------------")

except ValueError:
    print("Invalid input. Please enter numbers properly.")
    
