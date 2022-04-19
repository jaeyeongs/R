# Data Load
atm = read.csv("서울시 월별 평균 대기오염도 정보.csv")
head(atm)
tail(atm)

# 데이터 구조
str(atm)

# dplyr 라이브러리 사용
library(dplyr)

# select 함수를 사용하여 원하는 변수 저장
atm1 = select(atm, 측정월, 자치구, 미세먼지)
head(atm1)

# !complete.cases() : 결측 값 확인
atm1[!complete.cases(atm1),]

# aggregate() : 변수별 평균 구함
MonthMean = aggregate(미세먼지~측정월, atm1, mean)
AreaMean = aggregate(미세먼지~자치구, atm1, mean)

# ggplot2 : 시각화 라이브러리
library(ggplot2)
GGMonthMean = ggplot(MonthMean, aes(x = 측정월, y = 미세먼지))
GM1 = GGMonthMean+geom_point(aes(size=측정월))
GM2 = GM1 + labs(title = "월별 평균 미세먼지 농도-단위(㎍/㎥)")
GM2

plot(AreaMean, main = "자치구별 미세먼지 농도", ylab = "미세먼지(㎍/㎥)")

# 통계적 분석(월별 평균)
# 전체 평균이 월별 평균과 자치구별 평군보다 높은가에 대한 검정
mean(atm1$미세먼지, na.rm = TRUE)

# shapiro.test : 데이터의 정규 분포 검정
shapiro.test(MonthMean$미세먼지)

# t.test : 하나 또는 두 개 집단 평균 비교(정규 분포 가정)
# mu : 모평균
t.test(MonthMean$미세먼지, mu = 41.84)

# 통계적 분석(지역별 평균)
shapiro.test(AreaMean$미세먼지)
t.test(AreaMean$미세먼지, mu = 41.84)