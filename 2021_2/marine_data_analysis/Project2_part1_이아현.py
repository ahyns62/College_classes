import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import scipy.stats as stats
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split

dir = 'C:/Users/user/Desktop/'
file = '기말프로젝트 데이터 (Daejeon_weather).csv'

# Step 1
f1 = pd.read_csv(dir + file)

# Step 2
f1['date'] = pd.to_datetime(f1['date'])
f1['Year'] = f1['date'].dt.year
f1['Month'] = f1['date'].dt.month
f1['Day'] = f1['date'].dt.day

# Step 3
plt.plot(f1['pressure'], f1['temp'], 'go')
plt.xlabel('Pressure (hPa)')
plt.ylabel('Temperature(C)')

# Step 4
summer = f1.loc[(f1['Month'] >= 6) & (f1['Month'] <= 8)]
winter = f1.loc[(f1['Month'] > 11) | (f1['Month'] < 3)]


plt.plot(summer['pressure'], summer['temp'], 'ro')
plt.plot(winter['pressure'], winter['temp'], 'bo')

plt.legend(['all', 'summer', 'winter'], loc='best')

# Step 5
corr_matrix = f1.corr()

corr_df = corr_matrix['pressure'].sort_values(ascending=False)
print("Correlation coefficient:", corr_df)

# Step 6
x = f1[['pressure']]
y = f1[['temp']]

[x_train, x_test, y_train, y_test] = train_test_split(x, y, train_size=0.75, test_size=0.25)
mlr = LinearRegression()

r = stats.linregress(f1['pressure'], f1['temp'])
beta = r.slope
alpha = r.intercept
reg = beta * f1['pressure'] + alpha

plt.plot(x, reg, 'k')
plt.legend(['all', 'summer', 'winter', 'regression'], loc='best')
plt.show()




