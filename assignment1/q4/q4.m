%q4
hold off;
classes={'setosa','versicolor','virginica'};
T = readtable("Iris_dataset.csv");
t=T{:,1:4};
setosa=[t(2:50,3),t(2:50,4)];
versicolor=[t(52:100,3),t(52:100,4)];
virginica=[t(102:150,3),t(102:150,4)];
scatter(setosa(:,1),setosa(:,2),15,"magenta","filled");
hold on;
scatter(versicolor(:,1),versicolor(:,2),15,"blue","filled");
scatter(virginica(:,1),virginica(:,2),15,"red","filled");

%looks like the petal length and petal width have correlation
%so Mahalanobis distance is the opt one.

setosa_mean=mean(setosa);
versicolor_mean=mean(versicolor);
virginica_mean=mean(virginica);
setosa_z=setosa-[setosa_mean(1)*ones(49,1),setosa_mean(2)*ones(49,1)];
setosa_covariance=(setosa_z'*setosa_z)/48;
setosa_inv=inv(setosa_covariance);

versicolor_z=versicolor-[versicolor_mean(1)*ones(49,1),versicolor_mean(2)*ones(49,1)];
versicolor_covariance=(versicolor_z'*versicolor_z)/48;
versicolor_inv=inv(versicolor_covariance);

virginica_z=virginica-[virginica_mean(1)*ones(49,1),virginica_mean(2)*ones(49,1)];
virginica_covariance=(virginica_z'*virginica_z)/48;
virginica_inv=inv(virginica_covariance);
%input classification
s1=[t(1,3:4)];
scatter(s1(1),s1(2),50,"green","filled");
s1se=(s1-setosa_mean)*setosa_inv*(s1-setosa_mean)';
s1ve=(s1-versicolor_mean)*versicolor_inv*(s1-versicolor_mean)';
s1vi=(s1-virginica_mean)*virginica_inv*(s1-virginica_mean)';
[Min,I] = min([s1se,s1ve,s1vi]);
s1_class=classes(I);
fprintf("S1 belongs to %s and has a distance of %d std deviations from mean \n",char(s1_class),Min);

s2=[t(51,3:4)];
scatter(s2(1),s2(2),50,"green","filled");
s2se=(s2-setosa_mean)*setosa_inv*(s2-setosa_mean)';
s2ve=(s2-versicolor_mean)*versicolor_inv*(s2-versicolor_mean)';
s2vi=(s2-virginica_mean)*virginica_inv*(s2-virginica_mean)';
[Min,I] = min([s2se,s2ve,s2vi]);
s2_class=classes(I);
fprintf("S2 belongs to %s and has a distance of %d std deviations from mean \n",char(s2_class),Min);


s3=[t(101,3:4)];
scatter(s3(1),s3(2),50,"green","filled");
s3se=(s3-setosa_mean)*setosa_inv*(s3-setosa_mean)';
s3ve=(s3-versicolor_mean)*versicolor_inv*(s3-versicolor_mean)';
s3vi=(s3-virginica_mean)*virginica_inv*(s3-virginica_mean)';
[Min,I] = min([s3se,s3ve,s3vi]);
s3_class=classes(I);
legend({'Setosa','Versicolor','virginica','Sample-1','Sample-2','Sample-3'},'Location',"southeast");
xlabel('Petal Length (cm)');
ylabel('Petal Width (cm)');
fprintf("S3 belongs to %s and has a distance of %d std deviations from mean \n",char(s3_class),Min);
hold off;