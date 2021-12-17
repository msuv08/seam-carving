function img = sobel_energy_calculator(original_img) 
%SOBEL ENERGY_CALCULATOR Calculates energy with Sobel Operator
    % Convert img to grayscale, cast to double.
    img = im2gray(original_img);
    img = im2double(img);
    % Take x and y derivative filters of the image.
    sobel_x_filter = [-1 0 1; -2 0 2; -1 0 1];
    sobel_y_filter = [-1 -2 -1; 0 0 0; 1 2 1];
    % Apply the partial derivative filters.
    im_X = abs(imfilter(img, sobel_x_filter));
    im_Y = abs(imfilter(img, sobel_y_filter));
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
