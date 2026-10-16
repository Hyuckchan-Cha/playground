import matplotlib.pyplot as plt
import matplotlib.animation as animation
import numpy as np
import pandas as pd
import matplotlib.patches as patches


class ANI_Scatter(object):
    """An animated scatter plot using matplotlib.animations.FuncAnimation."""
    def __init__(self, numpoints, area, e,T,n_1):
        # 개체 수, 운동 영역
        self.num = numpoints
        self.area = (area **(1/3)) * 50
        self.e = e
        # 위치
        self.pos_x = np.random.rand(self.num) * self.area
        self.pos_y = np.random.rand(self.num) * self.area
        # 속도
        self.v_x = (np.arange(0,self.num) *100000000 -100000000) * np.sqrt(T)/5
        self.v_y = (np.arange(0,self.num) *100000000 -100000000) * np.sqrt(T)/5
        
        # 통합
        self.Data = pd.DataFrame(data={'Pos_x': self.pos_x, 'Pos_y': self.pos_y, 'V_x': self.v_x, 'V_y': self.v_y})
        self.DataChange = self.Data.copy()

        self.stream = self.data_stream()

        # Setup the figure and axes...
        self.fig, self.ax = plt.subplots()
        self.fig.set_size_inches(7,7)
        self.ax.add_patch(
            patches.Rectangle(
                (0,0),
                self.area,
                self.area,
                edgecolor = 'blue',
                facecolor = 'red',
                fill=False
                ))
        # Then setup FuncAnimation.
        self.ani = animation.FuncAnimation(self.fig, self.update, interval=0.0000001,
                                           init_func=self.setup_plot, blit=True)

    def setup_plot(self):
        """Initial drawing of the scatter plot."""
        Data = next(self.stream)
        color_list =[]
        for i in range(1,n_1 +1):
            color_list.append(1)
        for i in range(n_1+1,numpoints+1):
            color_list.append(10)
        self.scat = self.ax.scatter(Data['Pos_x'], Data['Pos_y'], c=color_list, s=100, marker='.', animated=True, vmin=0, vmax=10, cmap='jet')
        self.ax.axis([-self.area/4, self.area*5/4, -self.area/4, self.area*5/4])
        return self.scat,

    def data_stream(self):
        while True:
            # 운동 업데이트
            for i in range(self.num):
                for j in range(self.num):
                    if j != i:
                        # 공 i의 위치
                        x_i = self.DataChange['Pos_x'][i]
                        y_i = self.DataChange['Pos_y'][i]
                        # 공 j의 위치
                        x_j = self.DataChange['Pos_x'][j]
                        y_j = self.DataChange['Pos_y'][j]
                        # 두 공 간의 거리 계산
                        dis = (x_i - x_j) ** 2 + (y_i - y_j) ** 2

                        # 거리가 기준 거리 내로 다가왔을 때
                        if np.sqrt(dis) < self.area/30:
                            # 각 공의 속도
                            vi_x = self.DataChange['V_x'][i]
                            vi_y = self.DataChange['V_y'][i]
                            vj_x = self.DataChange['V_x'][j]
                            vj_y = self.DataChange['V_y'][j]

                            # 두 공이 가까워질 때만 충돌식 계산
                            # (이렇게 안하면, 충돌하고 나서도 거리가 충분히 멀어지지 않을 경우 문제가 발생)
                            if ((x_j - x_i)*(vj_x - vi_x) <= 0) or ((y_j - y_i)*(vj_y - vi_y) <= 0):
                                # 충돌각 계산
                                angle = np.arctan2((x_j - x_i), (y_j - y_i))

                                # 속도를 충돌방향과 수평성분, 수직성분으로 나눔
                                v1h = vi_x*np.cos(angle)+vi_y*np.sin(angle)    # 
                                v1v = vi_x*np.sin(angle)-vi_y*np.cos(angle)
                                v2h = vj_x*np.cos(angle)+vj_y*np.sin(angle)
                                v2v = vj_x*np.sin(angle)-vj_y*np.cos(angle)

                                # 충돌방향과 수직성분은 그대로
                                # 수평성분은 운동량 보존측과 탄성계수로부터 계산
                                e = self.e  # 탄성계수
                                mi = 1  # i 입자의 질량
                                mj = 1  # j 입자의 질량
                                nv1h = (v2h - v1h) * (1 + e) / (mi / mj + 1) + v1h
                                nv2h = (v1h - v2h) * (1 + e) / (mj / mi + 1) + v2h

                                # 속도의 수평, 수직 성분을 화면상 x, y 성분으로 수정
                                self.DataChange['V_x'][i] = nv1h * np.cos(angle) + v1v * np.sin(angle)
                                self.DataChange['V_y'][i] = nv1h * np.sin(angle) - v1v * np.cos(angle)
                                self.DataChange['V_x'][j] = nv2h * np.cos(angle) + v2v * np.sin(angle)
                                self.DataChange['V_y'][j] = nv2h * np.sin(angle) - v2v * np.cos(angle)

                    # 사각형 벽 조건 (벽을 벗어나면 속도가 반대가 되도록)
                        if self.DataChange['Pos_x'][i] >= self.area:
                            self.DataChange['V_x'][i] = abs(self.DataChange['V_x'][i]) * -1
                        elif self.DataChange['Pos_x'][i] <= 0:
                            self.DataChange['V_x'][i] = abs(self.DataChange['V_x'][i])
                        if self.DataChange['Pos_y'][i] >= self.area:
                            self.DataChange['V_y'][i] = abs(self.DataChange['V_y'][i]) * -1
                        elif self.DataChange['Pos_y'][i] <= 0:
                            self.DataChange['V_y'][i] = abs(self.DataChange['V_y'][i])

            for i in range(self.num):
                # 위치 업데이트

                self.DataChange['Pos_x'][i] = self.DataChange['Pos_x'][i] + self.DataChange['V_x'][i] * 0.0000000001
                self.DataChange['Pos_y'][i] = self.DataChange['Pos_y'][i] + self.DataChange['V_y'][i] * 0.0000000001


            yield self.DataChange

    def update(self, i):
        """Update the scatter plot."""
        Data = next(self.stream)
        self.scat.set_offsets(Data[['Pos_x', 'Pos_y']].values)
        return self.scat,

    def show(self):
        plt.xticks([])
        plt.yticks([])
        plt.title("volume : " + str(area) +"\n Pressure :" +str(round(P,3)), loc = 'right',pad = 20)
        plt.title("Temperature :"+ str(T), loc = 'center', pad = 20)
        plt.title("Number of \n the whole particles :" +str(numpoints), loc = 'left', pad =20)
        plt.xlabel("ideal gas 1 is blue color \n ideal gas 2 is red color", loc= 'center')
        plt.show(block=False)
        print("이 상황은 부피의 상댓값이", area,"일때 옆 한쪽 단면을 본 상황입니다." )
        print("보이는 입자의 크기는 항상 용기의 크기에 비례하여 정해집니다.")
        print("용기에 가해지는 압력의 상댓값은", P,"입니다.")
        print("(단, 압력값 1은 이상기체의 전체수, 부피와 절대온도의 상대값이 모두 1일때의 압력값)")
        print("이상기체 1의 몰분율은", X_1,"이고 이상기체2의 몰분율은", X_2,"입니다.")
        print("이상기체 1의 분압(상댓값)은", P_1,"이고 이상기체 2의 분압(상댓값)은",P_2, "입니다.")

numpoints = int(input("전체이상기체 입자의 수를 입력하시오(2~30) : "))
area = int(input("부피의 상댓값을입력하시오(1~10) : "))
e = float(input("이상기체는 탄성충돌을 하고 충돌계수는 1입니다, 1을 입력하시오 : "))
T = int(input("절대온도의 상댓값을 입력하시오 (1~10) : "))
n_1 = int(input("이상기체1의 입자 수를 입력하시오 (1~30) : " ))
#몰분율
X_1 = round(n_1 / numpoints,3)
X_2 = round((numpoints - n_1)/numpoints,3)
#압력(상댓값)
P = round(numpoints * T / area,3)
P_1 = round( P * X_1,3)
P_2 = round(P * X_2,3)
print("\n ----------------------------------------------------------------------- ")
print("이상기체2의 입자수는", numpoints - n_1 , "입니다")
a = ANI_Scatter(numpoints, area, e,T,n_1)
a.show()

