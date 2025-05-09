import matplotlib.pyplot as plt
from numpy import linspace


def y(t):
    if t <= -3:
        return 0
    elif t <= 1:
        return t + 3
    else:
        return 4


ts = linspace(-4, 4, 1000)
ys = [y(t) for t in ts]

plt.plot(ts, ys)
plt.xlabel(r"$t$", fontsize=20)
plt.ylabel(r"$y(t)$", fontsize=20)
plt.grid(True)
plt.show()
