def main():
    first = input("Please enter first name: ")
    last = input("Please enter last name: ")
    jediNameStr = last[:3]+first[:2]
    print(jediNameStr)
    power = 0
    for c in jediNameStr:
        power += ord(c)
    print(power)

main()
