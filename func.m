function [wPrim] = func(t,o, g1, g2, g3)
wPrim1 = g1*o(2)*o(3);
wPrim2 = g2*o(1)*o(3);
wPrim3 = g3*o(1)*o(2);
wPrim = [wPrim1; wPrim2; wPrim3];
end

