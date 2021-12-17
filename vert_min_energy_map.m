function v_min_energymap = vert_min_energy_map(energy_image)
%VERT_MIN_ENERGY_MAP Computes a vertical cumulative minimum energy map.
    % Create a zeroes matrix with dimensions of original matrix.
    shadow_img = zeros(size(energy_image,1), size(energy_image,2));
    % Find rows and cols, index cols - 1 (bottom pixel isn't 3-neighbored).
    rows = size(shadow_img,1);
    cols = size(shadow_img,2) - 1;
    % Set first column equal to original image col.
    shadow_img(1,:) = energy_image(1,:);
    % Loop through inner region of pixels.
    for r = 2:rows
        for c = 2:cols
            % Find energy pixel at (r,c).
            energy_pixel = energy_image(r,c);
            % Calculate min of 3 neighboring pixels.
            mid_pixel = shadow_img(r-1,c);
            top_pixel = shadow_img(r-1,c+1);
            bot_pixel = shadow_img(r-1,c-1);
            min_pixel = min([bot_pixel, mid_pixel, top_pixel]);
            % Sum pixels and assign to shadow_img.
            shadow_img(r,c) = energy_pixel + min_pixel;
        end
        % Special cases: Top and Bottom Column Pixels
        
        % ADD R=1 and R=ROWS-1 TO THIS & horiz_min_energy_map
        
        % Assign the pixel at the top of the column.
        pixel_above = energy_image(r,1); % Top column pixel.
        top_corner_pixel = shadow_img(r-1,1); % Top corner pixel.
        adj_pixel = shadow_img(r-1,2); % Adjacent neighbor to pixel.
        % Only take the min of two neighbors (3rd neighbor already calc.).
        shadow_img(r,1) = pixel_above + min([top_corner_pixel, adj_pixel]);
        
        % Assign the pixel at the end of the column.
        pixel_below = energy_image(r,cols-1); % Bottom column pixel.
        bot_corner_pixel = shadow_img(r-1,cols+1); % Bottom corner pixel.
        adj_pixel = shadow_img(r-1,cols); % Adjacent neighbor to pixel.
        % Only take min of bottom two neighbors (no 3rd pixel).
        shadow_img(r,cols+1) = pixel_below + min([bot_corner_pixel, adj_pixel]);
    end
    v_min_energymap = shadow_img;
end
