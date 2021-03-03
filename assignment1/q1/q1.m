%q1_a
h1 = [ 0.3333333, 0.5, 0.5];
h2 = [ 0.5, 0.333333, 0.5];
KL_h1_h2=sum(h1.*log2(h1./h2))
KL_h2_h1=sum(h2.*log2(h2./h1))

%q1_b
Battacharya_coeff=sum((h1.*h2).^0.5);
Battacharya_distance=-log(Battacharya_coeff)
