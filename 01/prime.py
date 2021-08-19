#!/usr/bin/env python3

def main():
    is_prime = True # Place your computation here
    number = int(open("input.txt").read().strip())
    i = 2
    while i*i <= number:
        if number % i == 0:
            is_prime = False
            break
        if i == 2:
            i+=1
        else:
            i+=2
    if is_prime:
        print("true")
    else:
        print("false")

if __name__ == '__main__':
    main()
