%% Enhancing Multispectral Color Composite Images
truecolor = multibandread('paris.lan', [512, 512, 7], 'uint8=>uint8', ...
                          128,  'bil', 'ieee-le', {'Band','Direct',[3 2 1]});
%%
f1= figure;
imshow(truecolor);
figure(f1);
title('Truecolor Composite (Un-enhanced)')
text(size(truecolor,2), size(truecolor,1) + 15,...
  'Image courtesy of Space Imaging, LLC',...
  'FontSize', 7, 'HorizontalAlignment', 'right')

%% Step 2: Use Histograms to Explore Un-Enhanced Truecolor Composite
f2=figure;
imhist(truecolor(:,:,1))
figure(f2);
title('Histogram of the Red Band (Band 3)')

%% Step 3: Use Correlation to Explore Un-Enhanced Truecolor Composite
r = truecolor(:,:,1);
g = truecolor(:,:,2);
b = truecolor(:,:,3);
f3 = figure;
plot3(r(:),g(:),b(:),'.')
grid('on')
xlabel('Red (Band 3)')
ylabel('Green (Band 2)')
zlabel('Blue (Band 1)')
figure(f3);
title('Scatterplot of the Visible Bands')

%% Step 4: Enhance Truecolor Composite with a Contrast Stretch
stretched_truecolor = imadjust(truecolor,stretchlim(truecolor));
f4 = figure;
imshow(stretched_truecolor)
figure(f4);
title('Truecolor Composite after Contrast Stretch')

%% Step 5: Check Histogram Following the Contrast Stretch
f5 = figure;
imhist(stretched_truecolor(:,:,1))
figure(f5);
title('Histogram of Red Band (Band 3) after Contrast Stretch')

%% Step 6: Enhance Truecolor Composite with a Decorrelation Stretch

decorrstretched_truecolor = decorrstretch(truecolor, 'Tol', 0.01);
f6 = figure;
imshow(decorrstretched_truecolor)
figure(f6);
title('Truecolor Composite after Decorrelation Stretch')

%% Step 7: Check Correlation Following the Decorrelation Stretch
r = decorrstretched_truecolor(:,:,1);
g = decorrstretched_truecolor(:,:,2);
b = decorrstretched_truecolor(:,:,3);
f7 = figure;
plot3(r(:),g(:),b(:),'.')
grid('on')
xlabel('Red (Band 3)')
ylabel('Green (Band 2)')
zlabel('Blue (Band 1)')
figure(f7);
title('Scatterplot of the Visible Bands after Decorrelation Stretch')

