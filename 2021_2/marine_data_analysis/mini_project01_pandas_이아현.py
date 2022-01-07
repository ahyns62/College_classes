import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

ddir = 'C:/Users/user/Desktop/'
nino3_data = 'nino3(1979-2020).txt'
sst_data = 'sst_df.txt'

f_nino3 = open(ddir + nino3_data, 'r').readlines()
list_nino3 = []
for i in f_nino3:
    list_nino3.append(float(i.strip()))

nino3_1d = np.array(list_nino3)
nino3 = nino3_1d.reshape(-1,12)

## import the sst_df.txt data from Pandas
sst = pd.read_csv('C:/Users/user/Desktop/sst_df.txt')

## Calculate the SST anomalies using groupby()
sst['sst_anom'] = sst.groupby(['month','lat','lon'])['sst'].apply(lambda x: (x - x.mean()))

#### Retrieving the Tropical Indian Ocean & Autumn ####
years = np.array(range(1979,2021)) #년도
avg_IO_sst_anom = np.zeros(len(years))


## retrieve the tropical Indian Ocean & Autumn
# 방법1
for i in range(len(years)):
    avg_IO_sst_anom[i] = sst[(sst['year']==years[i]) & (sst['lon']>=40) & (sst['lon']<=90) & (sst['lat']>=-25) & (sst['lat']<=25)
                          & (sst['month']>=9) & (sst['month']<=11)]['sst_anom'].mean()

# 방법2
#avg_IO_sst_anom = sst[(sst['lon']>=40) & (sst['lon']<=90) & (sst['lat']>=-25) & (sst['lat']<=25) & (sst['month']>=9) &
#                      (sst['month']<=11)]['sst_anom'].groupby(sst['year']).mean()


################### Mini Project #############################
summer_nino3 = nino3[:,8:11]    #가을철(9, 10, 11월) nino3
summer_mean_nino3 = np.mean(summer_nino3,axis=1)

idx_over = summer_mean_nino3 >= 1.0    # 여름철 nino3가 0.5 이상인 idx
idx_under = summer_mean_nino3 <= -1.0   # 여름철 nino3가 0.5 이하인 idx

# 열대 인도양 지역의 #가을철(9, 10, 11월)평균 SST anomaly (42년치)
plt.plot(years, avg_IO_sst_anom, 'k--', label='IO SST anomaly')

plt.plot(years[idx_over], avg_IO_sst_anom[idx_over], 'ro', label='El Nino years')
plt.plot(years[idx_under], avg_IO_sst_anom[idx_under], 'bs',label='La Nina years' )

plt.xlabel('years',fontsize=13)
plt.ylabel('SST anomaly', fontsize=13)
plt.legend(loc='best', fontsize = 13 )
plt.axis([1978,2022,-0.7, 0.9])
plt.show()

plt.xticks(np.arange(1980,2021,5), labels=['1980','','1990','','2020','','2010','','2020'])
plt.yticks(np.arange(-0.75,1,0.25))

plt.grid(axis='both')
plt.title('Indian Ocean SST anomalies', loc='center', pad=16)
