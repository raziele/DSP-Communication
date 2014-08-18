# -*- coding: utf-8 -*-
"""
Created on Mon Aug  4 01:24:05 2014

@author: raziele
"""
from numpy import * 
import matplotlib as mpl
import matplotlib.pyplot as plt
import pylab

N=1000
f=1./800 #dot is for the resault to be float and not integer. if both numbers are integer the resault is also integer
omega=2*pi*f
n=arange(N)
wave=zeros(N)

for i in range(1,11,2):
 wave=wave+sin(omega*i*n)/i

plt.plot(n, wave)
#plt.axis([0, N, -1.1, 1.1])
pylab.show()

