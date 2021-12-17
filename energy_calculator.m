function img = energy_calculator(original_img) 
%ENERGY_CALCULATOR Function to calculate energy
    img = im2gray(original_img);
    img = im2double(img);
    % Take x and y derivative filters of the image.
    x_filter = [-1,1];
    y_filter = [-1;1];
    % Apply the partial derivative filters.
    im_X = abs(imfilter(img, x_filter));
    im_Y = abs(imfilter(img, y_filter));
    % Square both images.
    sq_X = im_X .^2;
    sq_Y = im_Y .^2;
    % Combine squared images.
    cat_img = sq_X + sq_Y;
    cat_img = im2double(cat_img);
    % Square root images.
    cat_img = sqrt(cat_img);
    img = cat_img;
end