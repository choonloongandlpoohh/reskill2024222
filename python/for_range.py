# for i in range():
#     print(i)


# for a in range(5, 12) :
#     print('Hello, World!aaa', a)
    
    
# for b in range(0, 10, 2) :
#     print('Hello, World!bbb', b)
    
    
# for c in range(10, 0, -1) :     # 앞에 오는 숫자는 포함 뒤에 오는 숫자는 제외
#     print('Hello, World!ccc', c)      # 시험전에 체크!!!!
    
    
# for d in reversed(range(10)) :
#     print('Hello, World!ddd', d)
    
    
# count = int(input('반복할 횟수를 입력하세요 : '))
# for e in range(count) :
#     print('Hello, World!eee', e)


# for letter in 'python':
#     print(letter)
    
    
# fruits = ('apple', 'orange', 'grape')
# for letter in reversed(fruits):
#     print(letter)
        
    
fruits = ('apple', 'orange', 'grape')
for i in range(0,3):
    for letter in reversed(fruits[i]):
        print(letter, end='')
    print("")
    
fruits = ('apple', 'orange', 'grape')
for i in reversed(range(3)):
    for letter in reversed(fruits[i]):
        print(letter, end='')
    print("")