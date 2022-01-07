import numpy as np
import pandas as pd
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split

# Step 1
dir = 'C:/Users/user/Desktop/'
fn1 = '기말프로젝트 데이터 (Daejeon_weather).csv'
fn2 = '기말프로젝트 데이터(Daejeon_airquality).csv'

f1 = pd.read_csv(dir + fn1)
f2 = pd.read_csv(dir + fn2)

# Step 2
f1.drop(['ID', 'city'], axis=1, inplace=True)
f2.drop([' pm25'], axis=1, inplace=True)

# Step 3
df = pd.merge(f1, f2, how='outer', on='date')

# Step 4
df.sort_values(by='date', inplace=True)

# Step 5
df[' pm10'] = pd.to_numeric(df[' pm10'], errors='coerce')
df[' o3'] = pd.to_numeric(df[' o3'], errors='coerce')
df[' no2'] = pd.to_numeric(df[' no2'], errors='coerce')
df[' so2'] = pd.to_numeric(df[' so2'], errors='coerce')
df[' co'] = pd.to_numeric(df[' co'], errors='coerce')

# Step 6A
df['rain'].fillna(0, inplace=True)

# Step 6B
df.dropna(inplace=True)

# Step 7
df[' pm10'].hist(figsize=(12,8), bins=30)

# Step 8
df['log_pm10'] = np.log(df[' pm10'])
df.hist('log_pm10', figsize=(8, 5))

# Step 9
x = df[['temp', 'dewp', 'rain', 'wind', 'pressure', 'sun']]
y = df['log_pm10']

[x_train, x_test, y_train, y_test] = train_test_split(x, y, train_size=0.75, test_size=0.25)
mlr = LinearRegression()
mlr.fit(x_train, y_train)

print(mlr.score(x_train, y_train))
print(mlr.score(x_test, y_test))

# Step 10
r = np.zeros(100)

for j in range(100):
    [x_train, x_test, y_train, y_test] = train_test_split(x, y, train_size=0.75, test_size=0.25)
    mlr = LinearRegression()
    mlr.fit(x_train, y_train)
    y_predict = mlr.predict(x_test)

    print(mlr.score(x_train, y_train))
    print(mlr.score(x_test, y_test))
    #r[j] = mlr.score(x_test, y_test)
    r[j] = np.corrcoef(y_predict, y_test)[0,1]**2

print(np.average(r))