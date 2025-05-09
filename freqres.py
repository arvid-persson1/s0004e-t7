from cmath import phase

import matplotlib.pyplot as plt
from numpy import linspace


def h(w):
    iw = 1j * w
    return iw / (0.1 + iw)


ws = linspace(-1, 1, 1000)
mags = [abs(h(w)) ** 2 for w in ws]
args = [phase(h(w)) for w in ws]

plt.plot(ws, mags)
plt.xlabel(r"$\omega$", fontsize=20)
plt.ylabel(r"$|\mathcal{H}(i\omega)|^2$", fontsize=20)
plt.grid(True)
plt.show()

plt.plot(ws, args)
plt.xlabel(r"$\omega$", fontsize=20)
plt.ylabel(r"$\arg \mathcal{H}(i\omega)$", fontsize=20)
plt.grid(True)
plt.show()
