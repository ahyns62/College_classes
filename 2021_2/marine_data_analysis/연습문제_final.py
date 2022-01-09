# 1번
license_plate = "42 허 1192"
print(license_plate[5:])

# 2번
P_number = "010-4929-0415"
print(P_number.replace("-", " "))

# 3번
fruit = ['수박', '당근', '파인애플', '사과', '바나나']
fruit.append('복숭아')
print(fruit)
fruit.insert(3, '딸기')
print(fruit)
fruit.remove('당근')
print(fruit)

# 4번
nums = [10,20,30,40,50,60]
print(sum(nums))
print(len(nums))
print(sum(nums)/len(nums))
print(np.mean(nums))

# 5번
stocks = ["삼성전자", "카카오", "네이버", "현대자동차", "sk하이닉스"]
print('-'.join(stocks))
print(stocks[1:4])

# 6번
price = [1000, 2000, 3000]
plastic_bag = 100

for i in range(2):
  price[i] += plastic_bag
print(price)

# 7번
ABC = ['apple', 'beet', 'carrot']
for i in ABC:
  print(i, len(i))

# 8번
list1 = ['a', 'b', 'c', 'd']
for i in range(0, len(list1)-1):
    print(list1[i], list1[i+1])

# 9번
clap = 0
for i in range(1, 101):
  i = str(i)
  if i.count(str(3))==1:
    clap += 1
  if i.count(str(6))==1:
    clap += 1
  if i.count(str(9))==1:
    clap += 1
  if i.count(str(3))==2:
     clap += 2
  if i.count(str(6))==2:
    clap += 2
  if i.count(str(9))==2:
    clap += 2

print('"짝"이 나온 개수 :{}'.format(clap))


# 10번
# numpy 에서는 or 쓰지 못함.
numbers = list(range(1,101))

for i in range(1, 101):
  if (i % 2 == 0) or (i % 3 == 0) | (i % 5 == 0) | (i % 7 == 0):
    numbers.remove(i)

print(numbers)


# 11번
import numpy as np
a = np.linspace(10,100,10, endpoint=True)
b = np.arange(10,101,10)


# 12번
def C2K(c):
  k = c + 273.15
  return k

for i in range(-10, 31, 5):
  print('섭씨온도 {}도는 절대온도 {}K 입니다.'.format(i, C2K(i)))

# 13번
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

dir = 'C:/Users/user/Desktop/'
f = pd.read_csv(dir + 'weather.csv')

f['date'] = pd.to_datetime(f['date'])
f['Year'] = f['date'].dt.year
f['Month'] = f['date'].dt.month
f['Day'] = f['date'].dt.day
f.drop('date', axis=1, inplace=True)

f['temp(K)'] = C2K(f['temp'])


# 14번
mm = np.arange(1, 13)
mw = f.groupby(['Month'])['wind'].apply(np.mean)

plt.grid()
plt.title('monthly wind(avg)', fontsize=20)
plt.xlabel('month', fontsize=15)
plt.ylabel('wind(m/s)', fontsize=15)
plt.axis([0, 12, 6, 10])
plt.xticks(mm, label=['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'])
plt.plot(mm, mw, 'r*-')

# 15번
a = []
for i in range(1, 11):
  a.append(2 * i)

b = np.zeros(10)
for i in range(10):
  b[i] = 3 * (i + 1)

'''
100개의 전구가 꺼진 상태로 일렬로 서있다. 전원스위치는 조작할때마다 꺼지고 켜지기를 반복한다.
1번부터 10번까지 배정받은 10명의 학생이 한명씩 이 전구들을 지나가면서
본인 번호의 배수에 해당하는 전구의 스위치를 조작한다.
10명의 학생이 전부 지나간 뒤 켜진 전구의 개수는 몇개인가?
단, 전구의 번호는 1부터 100까지이고 첫번째 학생이 지나가면 모든 전구가 켜진다.
힌트: 꺼져있으면 키고, 켜져있으면 끈다.
'''

# 전구 해답1 : bulb_switch 라는 함수를 이용하여 전구를 켜고 끔
def bulb_switch(n):   #전구가 1이면 0으로 바꾸고, 0이면 1로 바꾸는 함수
    if n == 1:
        n =0
    elif n ==0:
        n = 1
    return n

bulb = np.zeros(100)        # 100개의 0인 전구
for i in range(1,11):       # 1번부터 10번학생의 전구터치
    for j in range(1,101):      #1번전구부터 100번전구의 상태
        if j%i == 0:            # 전구가 학생 번호로 나누어 떨어지면,
            bulb[j-1] = bulb_switch(bulb[j-1])  #전구의 on/off가 변함 (함수)
print('켜진 전구의 개수는 {} 입니다.'.format(int(sum(bulb)))) #행위가 모두 이루어지고 난 후 1인 전구의 개수




#전구 해답2 : 함수를 쓰지 않고 np.where
bulb_count = np.zeros(100)  # 100개의 꺼진(0) 전구
for i in range(1,11):        # 1번부터 10번학생의 전구터치
    for j in range(1,101):      #1번전구부터 100번전구의 상태
        if j%i ==0:             # 전구가 학생 번호로 나누어 떨어지면,(학생이 터치하면)
            bulb_count[j-1] += 1    #전구의 터치 횟수 +1
print('켜진 전구:', sum(np.where(bulb_count%2==0,0,1))) #터치횟수가 홀수면 켜진전구, 짝수면 꺼진전구







