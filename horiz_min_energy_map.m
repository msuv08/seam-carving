function h_min_energymap = horiz_min_energy_map(energy_image)
%HORIZ_MIN_ENERGY_MAP Computes a horizontal cumulative minimum energy map.
    % Create a zeroes matrix with dimensions of original matrix.
    shadow_img = zeros(size(energy_image,1), size(energy_image,2));
    % Find rows and cols, index rows - 1 (bottom pixel isn't 3-neighbored).
    rows = size(shadow_img,1) - 1;
    cols = size(shadow_img,2);
    % Set first row equal to original image row.
    shadow_img(:,1) = energy_image(:,1);
    % Loop through inner region of pixels.
    for c = 2:cols
        for r = 2:rows
            % Find energy pixel at (r,c).
            energy_pixel = energy_image(r,c);
            % Calculate min of 3 neighboring pixels.
            mid_pixel = shadow_img(r,c-1);
            top_pixel = shadow_img(r+1,c-1);
            bot_pixel = shadow_img(r-1,c-1);
            min_pixel = min([bot_pixel, mid_pixel, top_pixel]);
            % Sum pixels and assign to shadow_img.
            shadow_img(r,c) = energy_pixel + min_pixel;
        end
        % Special cases: Top and Bottom row Pixels
        % Assign the pixel at the top of the column.
        pixel_above = energy_image(1,c); % Top row pixel.
        left_corner_pixel = shadow_img(1,c-1); % Top corner pixel.
        adj_pixel = shadow_img(2,c-1); % Adjacent neighbor to pixel.
        % Only take the min of two neighbors (3rd neighbor already calc.).
        shadow_img(1,c) = pixel_above + min([left_corner_pixel, adj_pixel]);

        % Assign the pixel at the end of the column.
        pixel_above = energy_image(rows+1,c); % Top row pixel.
        right_corner_pixel = shadow_img(rows,c-1); % Bottom corner pixel.
        adj_pixel = shadow_img(rows+1,c-1); % Adjacent neighbor to pixel.
        % Only take min of bottom two neighbors (no 3rd pixel).
        shadow_img(rows+1,c) = pixel_above + min([right_corner_pixel, adj_pixel]);
    end
    h_min_energymap = shadow_img;
end