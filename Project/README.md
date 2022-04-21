## ggplot2를 활용한 2019년 서울시 미세먼지 분석

### 1. 연구 목적 및 배경
 
- 인구 밀집도가 높은 서울시의 대기오염 요인 중 미세먼지가 어느 시기, 어느 지역에 가장 심각한지 알아보고자 한다.
- 2019년 서울시 대기오염도 데이터를 이용하여 서울시에서 가장 문제가 심각한 시기와 지역을 알아보고 이를 ggplot2 으로 시각화 해본다. 

### 2. 사용 데이터

![image](https://user-images.githubusercontent.com/87981867/164451714-7208e69e-b34d-4a4c-8bb7-0e2c4b407766.png)


- 서울시 월별 평균 대기오염도 정보.csv 
- 출처 : 서울 열린데이터 광장(http://data.seoul.go.kr/)
- 관측치 : 300개
- Factor : 자치구
- num : 이산화질소농도, 오존농도, 일산화탄소농도, 아황산가스
- int : 측정월, 미세먼지

### 3. 분석

**3.1 데이터 시각화를 이용한 분석**
 
 ![image](https://user-images.githubusercontent.com/87981867/164452000-2adbda7c-e4f9-466c-af03-246c9c873988.png)

- dplyr 라이브러리 사용을 선언하고 select() 함수를 이용하여 분석하고자 하는 변수만 뽑아서 만들어진 데이터셋(atm1) 확인
 
 ![image](https://user-images.githubusercontent.com/87981867/164452091-4f9caf22-e5ad-4915-bec5-cd2f1bbc942a.png)
 
- 결측 값이 있는지 알기 위해 !complete.cases() 함수를 통해 205번 행에 결측 값이 있음을 알 수 있음

![image](https://user-images.githubusercontent.com/87981867/164452419-c3527f36-ad3f-4fea-ba9d-bfd55d7117b1.png)
![image](https://user-images.githubusercontent.com/87981867/164452438-de4d1efc-855b-4357-a50a-1d667ea26b40.png)
![image](https://user-images.githubusercontent.com/87981867/164452466-cb4bd426-690b-4b51-90f9-ddc6614d1508.png)
   
- aggregate() 함수를 사용하여 측정월별, 자치구별 미세먼지 평균을 구함
- 이를 통해서 각 자치구별 평균 미세먼지가 가장 높은 곳은 관악구(48.54545), 미세먼지가 가장 심각한 시기는 3월(70.24)임을 알 수 있음
 
 ![image](https://user-images.githubusercontent.com/87981867/164452624-bd62653e-b86a-4e67-b830-87b9fd1ec003.png)
 
- 측정월별 미세먼지 농도 평균을 ggplot2을 이용하여 시각화
- 그래프에서도 보다시피 3월이 미세먼지 농도(㎍/㎥)가 가장 눈에 띄게 높음
 
![image](https://user-images.githubusercontent.com/87981867/164452651-18b4634c-4d6f-4a51-b46d-65f812006321.png)

- 자치구별 미세먼지 농도 평균을 plot 함
- 관악구가 평균 미세먼지 농도가 가장 높음을 알 수 있음

**3.2	통계적 분석**

![image](https://user-images.githubusercontent.com/87981867/164452894-0705be59-7b55-4c2e-81a3-b170fc50accb.png)

- 미세먼지 농도의 전체 평균은 41.83612, 그렇다면 전체 평균이 각 월별 평균과 자치구별 평균보다 높은가에 대한 검정이 필요 
 
![image](https://user-images.githubusercontent.com/87981867/164452930-a0c375dc-cc83-4041-81ec-6bfda0ec9979.png)

- t-test 검정을 위해 shapiro.test를 통해 정규 분포를 하는지를 검정
- 월별 평균인 MonthMean의 p-value 값이 0.05보다 크므로 정규 분포를 하고 있음

![image](https://user-images.githubusercontent.com/87981867/164453141-d60cfba3-bbf8-41ca-a2c1-d813876ea929.png)

- 귀무가설(H0) : 전체 평균이 월별 평균보다 크지 않다
- 대립가설(H1) : 전체 평균이 월별 평균보다 크다
- t-test 결과 p-value가 0.05보다 크므로 귀무가설을 채택하고 전체 평균은 월별 평균보다 크지 않다고 볼 수 있음

![image](https://user-images.githubusercontent.com/87981867/164453325-31d52a90-5952-4481-95ce-c8f753dee188.png)

- 지역별 평균이 전체 평균보다 큰지 알기 위해 정규성 검정을 실시
- 지역별 평균은 정규분포를 하고 있고 t-test 검정 결과 p-value가 0.05보다 크므로 전체 평균은 지역별 평균보다 크지 않다고 볼 수 있음

