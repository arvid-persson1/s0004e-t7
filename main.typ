#set heading(numbering: "1a.")

=

Define $S: x |-> y$.

==

$
     & S(x_1(t) + x_2(t)) \
    =& e^(x_1(t + 2) + x_2(t + 2)) \
   !=& e^(x_1(t + 2)) + e^(x_2(t + 2)) \
    =& S(x_1(t)) + S(x_2(t)) \
\
     & S(x(t + t_0)) \
    =& e^(x(t + t_0 + 2)) \
    =& y(t + t_0) \
\
     & |x(t)| < infinity \
 ==> & |x(t_0 + 2)| < infinity \
<==> & |e^(x(t_0 + 2))| < infinity \
<==> & |y(t)| < infinity \
\
     & t + 2 > t
$

The system is *nonlinear*, *time-invariant*, *stable* and *non-causal*.

==

$
     & S(x_1(t) + x_2(t)) \
    =& cos(omega_c t + (x_1(t) + x_2(t))) \
   !=& cos(omega_c t + x_1(t)) + cos(omega_c t + x_2(t)) \
    =& S(x_1(t)) + S(x_2(t)) \
\
     & S(x(t + t_0)) \
    =& cos(omega_c t + x(t + t_0)) \
   !=& cos(omega_c (t + t_0) + x(t + t_0)) \
    =& y(t + t_0) \
\
     & |t| < infinity \
<==> & |cos(t)| < infinity \
<==> & |y(t)| < infinity \
\
     & t = t
$

The system is *nonlinear*, *time-variant*, *stable* and *causal*.

==

$
     & S(c x(t)) \
    =& (A + c x(t)) cos(omega_c t) \
   !=& c (A + x(t)) cos(omega_c t) \
    =& c S(x(t)) \
\
     & S(x(t + t_0)) \
    =& (A + x(t + t_0)) cos(omega_c t) \
   !=& (A + x(t + t_0)) cos(omega_c (t + t_0)) \
    =& y(t + t_0) \
\
     & |t|, |x(t)| < infinity \
<==> & |cos(t)|, |x(t) + C| < infinity \
<==> & y(t) < infinity \
\
     & t = t = t
$

The system is *nonlinear*, *time-variant*, *stable* and *causal*.

==

$
     & S(a x_1(t) + b x_2(t)) \
    =& (a x_1(t) + b x_2(t) + a x_1(-t) + b x_2(-t)) / 2 \
    =& a (x_1(t) + x_1(-t)) / 2 + b (x_2(t) + x_2(-t)) / 2 \
    =& a S(x_1(t)) + b S(x_2(t)) \
\
     & S(x(t + t_0)) \
    =& (x(t + t_0) + x(-t + t_0)) / 2 \
   !=& (x(t + t_0) + x(-(t + t_0))) / 2 \
    =& (x(t + t_0) + x(-t - t_0)) / 2 \
    =& y(t + t_0) \
\
     & |x(t)| < infinity \
 ==> & |x(t_0)|, |x(-t_0)| < infinity \
<==> & |x(t_0) + x(-t_0)| < infinity \
<==> & |C(x(t_0) + x(-t_0))| < infinity \
<==> & |y(t)| < infinity \
\
     & -t > t & t < 0
$

The system is *linear*, *time-variant*, *stable* and *non-causal*.

=

$
y(t) &= integral_(-infinity)^infinity h(tau) x(t - tau) dif tau \
     &= integral_(-infinity)^infinity (delta(tau) - 3e^(-3tau) u(tau)) u(-(t - tau)) dif tau \
     &= integral_t^infinity (delta(tau) - 3e^(-3tau) u(tau)) dif tau \
     &= integral_t^infinity delta(tau) dif tau - integral_t^infinity 3e^(-3tau) u(tau) dif tau \
     &= integral_t^infinity delta(tau) dif tau - integral_max(t, 0)^infinity 3e^(-3tau) dif tau \
     &= integral_t^infinity delta(tau) dif tau + e^(-3max(t, 0)) \
     &= cases(
          1 - e^0     & quad & t < 0,
          0 - e^(-3t) & quad & t >= 0,
        ) \
     &= -e^(-3t) u(t)
$

=

==

$
h(t) &= integral_(t - 2)^(t + 2) delta(tau) dif tau \
     &= cases(
          1 & quad & -2 < t < 2,
          0 & quad & t <= -2 or t >= 2,
        ) \
     &= u(t + 2) - u(t - 2)
$

==

$
|x(t)| <= M < infinity \
<==> integral_(t - 2)^(t + 2) |x(tau)| dif tau <= integral_(t - 2)^(t + 2) M dif tau = 4M < infinity
$

The system is *stable*.

==

$
t + 2 > t
$

The system is *non-causal*.

==

$
y(t) &= integral_(-infinity)^infinity h(tau) x(t - tau) dif tau \
     &= integral_(-infinity)^infinity (u(tau + 2) - u(tau - 2)) u(t - tau + 1) dif tau \
     &= integral_(-infinity)^(t + 1) (u(tau + 2) - u(tau - 2)) dif tau \
     &= integral_(-infinity)^(t + 1) u(tau + 2) dif tau - integral_(-infinity)^(t + 1) u(tau - 2) dif tau \
     &= cases(
          0     & quad & t < -3,
          t + 3 & quad & -3 <= t <= 1,
          4     & quad & t > 1,
        )
$

#figure(
  image("images/y1.png"),
  caption: "The signal as a function of time.",
)

=

==

$
h(t) &= (u(t + 3) - u(t - 5)) * delta(t - t_d) \
     &= u(t - t_d + 3) - u(t - t_d - 5)
$

#figure(
  image("images/block.png", width: 60%),
  caption: "Block diagram of the resulting system.",
)

==

$
cases(-t_d + 3 >= 0, -t_d - 5 >= 0) <==> t_d >= -5
$

==

LTI-1:
$
integral_(-infinity)^infinity |u(t + 3)| dif t = integral_(-3)^infinity dif t = infinity
$

LTI-2:
$
integral_(-infinity)^infinity |u(t - 5)| dif t = integral_5^infinity dif t = infinity
$

LTI-3:
$
integral_(-infinity)^infinity |delta(t - t_d)| dif t = 1 < infinity
$

LTI-4:
$
integral_(-infinity)^infinity |u(t - t_d + 3) - u(t - t_d - 5)| dif t = 8 < infinity
$

LTI-1 and LTI-2 are *unstable*. LTI-3 and LTI-4 are *stable*.

=

==

$
h(t) &= (h_1 * delta')(t) \
     &= -3e^(-3t) u(t) + e^(-3t) delta(t) \
     &= delta(t) - 3e^(-3t) u(t)
$

==

$
y(t) &= (h_1 * delta' * u)(t) \
     &= (u * delta' * h_1)(t) \
     &= (delta * h_1)(t) \
     &= h_1(t) \
     &= e^(-3t) u(t)
$

==

$
y(t) &= h(t) * (u(t) - u(t - 10)) \
     &= h(t) * u(t) - h(t) * u(t - 10) \
     &= e^(-3t) u(t) - e^(-3(t - 10)) u(t - 10)
$

=

==

$
cal(H)(i omega) = 1 - 0.1/(0.1 + i omega) = (i omega)/(0.1 + i omega)
$

==

#figure(
  image("images/mag.png"),
  caption: "The magnitude of the frequency response squared.",
)

#figure(
  image("images/arg.png"),
  caption: [
    The phase of the frequency response. Note that the vertical line is an
    asymptote and is not representative of the actual function.
  ],
)

==

$
sup |cal(H)(i omega)|^2 = lim_(omega -> plus.minus infinity) |cal(H)(i omega)|^2 = 1
$

There is no $omega$ such that the square magnitude assumes its maximum value.

$
sup arg cal(H)(i omega) = lim_(omega -> 0^+) arg cal(H)(i omega) = pi/2
$

However, $cal(H)(0) = 0$, so there is no $omega$ such that the phase
assumes its maximum value either.

==

$
cases(
  x_1(t) &= 10,
  x_2(t) &= 20cos(0.1t),
  x_3(t) &= delta(t - 0.2),
) quad &==> quad x(t) = x_1(t) + x_2(t) + x_3(t) \
\
cal(H)(0) = 0 quad &==> quad y_1(t) = (h * x_1)(t) = 0 \
cal(H)(0.1i) = sqrt(2)/2 e^(pi/4 i) quad &==> quad y_2(t) = (h * x_2)(t) = 10sqrt(2) cos(0.1t + pi/4) \
\
y(t) &= (h * x)(t) \
     &= (h * x_1)(t) + (h * x_2)(t) + (h * x_3)(t) \
     &= 10sqrt(2) cos(0.1t + pi/4) + delta(t - 0.2) - 0.1e^(-0.1(t - 0.2)) u(t - 0.2) \
$
