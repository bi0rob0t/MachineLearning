import numpy as np
from matplotlib import pylab
from mpl_toolkits.mplot3d import Axes3D
 
 
 
def f(x1, x2):
    return x1 ** 2 +10*x2 ** 2
 
 
def goldenratio(x,y): 
    e = 0.1
    a = 0
    b = 1
    k1 = (3-5**0.5)/2
    k2 = (5**0.5 -1)/2
    l1 = a + k1 * (b - a)
    l2 = a + k2 * (b - a)
    f1 = l1*f(x,y)
    f2 = l2*f(x,y)
    while (b - a)/2 >=e:
        if f1 < f2:
            b, l2, f2 = l2, l1, f1
            l1 = a + k1 * (b - a)
            f1 = l1 * f(x, y)
        else:
            a, l1, f1 = l1, l2, f2
            l2 = a + k2 * (b - a)
            f2 = l2 * f(x, y)
 
    return (a+b)/2
 
def grad_descent():
    global f
    x,y = 10, 10
    steps = [[20, 20, 20]]
    i = 0
    steps.append([x, y, f(x, y)])
    while abs(steps[-1][2] - steps[-2][2]) >= 10**(-13):
        i += 1
        lr = goldenratio(x,y)
        grad_x1 = 2*x #
        grad_x2 = 20*y 
        x -= lr*grad_x1
        y -= lr*grad_x2
        steps.append([x, y, f(x, y)])
        print(i)
    return np.array(steps)
 
def makeData ():
    x = np.arange (-10, 10, 0.01)
    y = np.arange (-10,10, 0.01)
    xgrid, ygrid = np.meshgrid(x, y)
 
    zgrid =f(xgrid, ygrid)
    return xgrid, ygrid, zgrid
 
 
 
steps = grad_descent()
x, y, z = makeData()
fig = pylab.figure()
axes = Axes3D(fig)
#
for i in steps[1::]:
    axes.scatter(i[0], i[1], i[2],  color='red')
axes.plot_surface(x, y, z, color='#7FFFD4', alpha=0.5)
print(steps[-1])
fig2 = pylab.contour(x,y,z)
pylab.show()
