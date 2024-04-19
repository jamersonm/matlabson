clc
a = 150;
t = -a*pi:0.01:a*pi;

w1 = 0;
w2 = 4/3;
w3 = 3/4;
w4 = 9/20;
f1 = 0;
f2 = pi/3;
f3 = -pi/4;
f4 = 2*pi/2;
a1 = 1;
a2 = 3;
a3 = 4;
a4 = 5;

fun1 = a1*-1/2;
fun2 = a2*cos(w2*t + f2);
fun3 = a3*cos(w3*t + f3);
fun4 = a4*cos(w4*t + f4);

plot(t, fun1 + fun2 + fun3 + fun4); grid on
