# cpg module

import numpy as np
from copy import deepcopy
from scipy.integrate import ode

import matplotlib.pyplot as plt
from matplotlib import rc
from matplotlib.ticker import MultipleLocator


class CPG:

    def __init__( self ) :
        # quadruped walk
        self.k = [[0.,-1.,1.,-1.],[-1.,0.,-1.,1.],
                  [-1.,1.,0.,-1.],[1.,-1.,-1.,0.]]
        self.omega_sw = 1.                # oscil.'s ang vel in swing
        self.omega_st = 4.*self.omega_sw  # oscil.'s ang vel in stance
        self.alpha = 5.
        self.beta = 50.
        self.mu = 1.                      # sqrt(mu) is oscil.'s stable amp
        self.b = 100.

        self.n=len(self.k)
        self.omega = np.zeros(self.n).tolist()
        self.r = np.zeros(self.n).tolist()
        
        x=[]
        for i in xrange( self.n ) :
            x.append( -np.sqrt(self.mu)*(1-np.cos(i*np.pi/4.0)) ) 
        y = np.zeros( len(self.k) ).tolist()
        
        self.s0 = x+y # initial state

    def _dsdt( self, t, s ) :
        ds = deepcopy( s )

        for i in xrange( self.n ) :
            self.omega[i] = self.omega_st / (np.exp(-self.b*s[self.n+i])+1.0) \
                            + self.omega_sw / (np.exp(self.b*s[self.n+i])+1.0)
            self.r[i] = np.sqrt( s[i]**2 + s[self.n+i]**2 )

            ds[i] = self.alpha*(self.mu-self.r[i]**2) * s[i] \
                    - self.omega[i]*s[self.n+i]
            
        for i in xrange( self.n ) :
            ds[self.n+i] = self.beta*(self.mu-self.r[i]**2) * s[self.n+i] \
                           + self.omega[i]*s[i] \
                           + np.array(self.k[i]).dot(np.array(s[self.n:]))

        return ds

    def simulate( self, t ) :
        """
        Simulate's the cpg for t seconds from initial state, s0.
        Updates class variable s0 with result and returns this state.
        """        
        solver = ode(self._dsdt).set_integrator('dopri5',
                                                rtol=1e-3, nsteps=100)
        solver.set_initial_value(self.s0, 0)
        s = solver.integrate(t)

        self.s0 = s
        return s.tolist()

    def plot( self, T, dt ) :
        t=[0]
        s=[self.s0]
        while t[-1] < T :
            t += [ t[-1]+dt ]
            s += [self.simulate(dt)]
        x=[]
        y=[]
        for si in s :
            x += [si[:self.n]]
            y += [si[self.n:]]

        f = plt.figure(1,figsize=(3.4,2.55)) # ,tight_layout=True 
        rc('font', family='serif', size=10)
        rc('text', usetex=True)
        rc('text.latex', unicode=True, preamble=[r"\usepackage{times}",
                                                 r"\usepackage[T1]{fontenc}",
                                                 r"\usepackage{amsmath}"])

        
        plt.subplot(211)             # first subplot in first figure
        plt.plot(t, x, lw=2)
        plt.title(r'Oscillator x(t)', fontsize=10)
        plt.xlabel(r'\text{time} (s)', fontsize=10)
        plt.autoscale(enable=True,axis='both',tight=True)
        # add minor tick marks
        ax=f.gca()
        self._plot_ticks(ax, dx=1, xaxis='zero', yaxis='zero')
        
        plt.subplot(212)             # second subplot in first figure
        plt.plot(t, y, lw=2)
        plt.title(r'Oscillator $y(t)$',fontsize=10)
        plt.axis([t[0],t[-1],-1.15,1.15])
        plt.xlabel(r'\text{time} (s)', fontsize=10)
        plt.autoscale(enable=True,axis='both',tight=True)
        # add minor tick marks
        ax=f.gca()
        self._plot_ticks(ax, dx=1, xaxis='zero', yaxis='zero')

        mng = plt.get_current_fig_manager()
        mng.window.resize(1280,1020)
        plt.show()
        
    def _plot_ticks( self, ax, dx=.25, dy=.25,
                     xaxis='default', yaxis='default' ) :
        ax.xaxis.set_ticks_position('bottom')
        ax.yaxis.set_ticks_position('left')
        if xaxis is not 'default' :
            ax.spines['bottom'].set_position(xaxis)
            ax.spines['top'].set_color('none')
            ax.xaxis.set_label_coords(0.97, 0.47)
        if yaxis is not 'default' :
            ax.spines['left'].set_position(yaxis)
            ax.spines['right'].set_color('none')
        xticks = ax.xaxis.get_major_ticks()[0].set_visible(False)
        ax.xaxis.set_minor_locator(MultipleLocator(dx))
        ax.yaxis.set_minor_locator(MultipleLocator(dy))
