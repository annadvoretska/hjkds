num = 38

class Solution(object):
    def addDigits(self, num):
        print("num =", num)

        while num >= 10:
            digit_sum = 0

            digit_sum = digit_sum + (num%10)
            num = num // 10

            digit_sum = num + digit_sum
            num = digit_sum

            if num < 10:
                return digit_sum
        return num
