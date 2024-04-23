from random import randint
even_count = 0
odd_count = 0

while even_count < 6 and odd_count < 6:
    lotto = [
        randint(1, 14),
        randint(3, 23),
        randint(10, 33),
        randint(14, 37),
        randint(24, 43),
        randint(33, 45)
    ]

    if 100 <= sum(lotto) <= 170:
        even_numbers = sum(1 for num in lotto if num % 2 == 0)
        odd_numbers = sum(1 for num in lotto if num % 2 != 0)
        print(sorted(lotto))
        even_count += 1
        odd_count += 1
        
        
        
# from random import randint
# even_count = 0
# odd_count = 0

# while even_count < 6 and odd_count < 6:
#     lotto = [
#         randint(1, 14),
#         randint(3, 23),
#         randint(10, 33),
#         randint(14, 37),
#         randint(24, 43),
#         randint(33, 45)
#     ]

#     if 100 <= sum(lotto) <= 170:
#         even_numbers = sum(1 for num in lotto if num % 2 == 0)
#         odd_numbers = sum(1 for num in lotto if num % 2 != 0)
#         print(sorted(lotto))
#         even_count += 1
#         odd_count += 1        