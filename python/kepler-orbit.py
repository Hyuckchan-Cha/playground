import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation

fig = plt.figure()
plt.subplot(polar=True)
 
a = float(input("장반지름을 입력하세요:"))
e = float(input("이심율을 입력하세요:"))
T = float(input("주기를 입력하세요:"))

_theta = np.linspace(0, 2*np.pi, 101)
_r = a*(1-e**2) / (1+e*np.cos(_theta))

plt.plot(_theta, _r, alpha = 0.5)
 
Earth, = plt.plot([], [], 'co',label = 'The Earth')
Sun = plt.scatter(0,0,s=100
                  , c = 'r',alpha = 1, label = 'Sun')
plt.legend(loc='upper left')
theta = [0,0]
r = [a*(1-e),a*(1-e)]

def animate(i):
    t = i/50
    dt = 0.1
    if i in range(1,1000000):
        print(i)
        theta.append(theta[i] + (2*(np.pi)*dt / T) * (a/r[i])* (a/r[i]) * np.sqrt(1-e*e))
        #theta.append(theta[i] - (2* a* (np.pi)*dt / T) * (1+e*np.cos(theta[i])) / np.sqrt(1-e*e) )  
        #r.append(r[i] - (2* a*(np.pi)*dt / T) * e * np.sin(theta[i]) / np.sqrt(1-e*e))
        r.append(a*(1-e**2) /(1+e*np.cos(theta[i+1])))
        Earth.set_data(theta[i+1], r[i+1])
        return Earth,
 
 
anim = animation.FuncAnimation(fig, animate,
                               frames=10000, interval=20)
plt.axis('off')
plt.show()

