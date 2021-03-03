img1=imread('Reference_image1.jpg');
img2=imread('Reference_image2.jpg');
qimg=imread('Query_image.jpg');

figure;
[imh1]=histogram(img1,256);
title('Reference_Image 1');
figure;
[imh2]=histogram(img2,256);
title('Reference_Image 2');
figure;
[imq]=histogram(qimg,256);
title('Test_Image');

imq_0=imq.Values;
imh_1=imh1.Values;
imh_2=imh2.Values;

%Euclidean Distance measure 
dist_r1_t=(sum((imh_1-imq_0).^2))^0.5;
dist_r2_t=(sum((imh_2-imq_0).^2))^0.5;
[min_dist,index]=min([dist_r1_t,dist_r2_t]);
fprintf("The test image belongs to class same as reference image %d with a distance of %d",index,min_dist);


img1=imread('Reference_image1.jpg');
img2=imread('Reference_image2.jpg');
qimg=imread('Query_image.jpg');

figure;
[imh1]=histogram(img1,256);
title('Reference_Image 1');
figure;
[imh2]=histogram(img2,256);
title('Reference_Image 2');
figure;
[imq]=histogram(qimg,256);
title('Test_Image');

imq_0=imq.Values;
imh_1=imh1.Values;
imh_2=imh2.Values;

%Euclidean Distance measure 
dist_r1_t=(sum((imh_1-imq_0).^2))^0.5;
dist_r2_t=(sum((imh_2-imq_0).^2))^0.5;
[min_dist,index]=min([dist_r1_t,dist_r2_t]);
fprintf("The test image belongs to class same as reference image %d with a distance of %d",index,min_dist);


