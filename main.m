% cityim = imread('City.jpg');
% se =  [0 1 0; 1 1 1; 0 1 0];
% filteredim = imdilate(cityim, se) - imerode(cityim, se);
% figure;
% subplot(1,2,1); imshow(cityim); title('Original');
% subplot(1,2,2); imshow(filteredim); title('Filtered Image');
% disp '*** Finish Solving problem 1.1 ***'
% pause;
% 
% smallsquaresim = imread('SmallSquares.tif');
% se = strel([0 1 0; 0 1 1; 0 0 0]);
% filteredim = imdilate(smallsquaresim, se);
% grad = smallsquaresim - filteredim;
% count = -sum(grad(:));
% figure;
% subplot(1,2,1); imshow(smallsquaresim); title('Original');
% subplot(1,2,2); imshow(filteredim); title('Filtered Image');
% disp 'number of hits';
% count
% disp '*** Finish Solving problem 1.2 ***';
% pause

wireim = imread('Wirebond.tif');
se =  strel('disk', 6, 0);
filteredim1 = imerode(wireim, se);
se =  strel('disk', 4, 0);
filteredim2 = imerode(wireim, se);
se = strel('disk', 8, 0);
filteredim3 = imerode(imerode(imerode(wireim, se), se), se);
figure
subplot(1,4,1); imshow(wireim); title('Original');
subplot(1,4,2); imshow(filteredim1); title('Filtered Image 1');
subplot(1,4,3); imshow(filteredim2); title('Filtered Image 2');
subplot(1,4,4); imshow(filteredim3); title('Filtered Image 3');
pause
close;


