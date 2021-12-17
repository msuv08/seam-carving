function [new_img] = removeHorizontal(img, numPixels)
%REMOVEHORIZONTAL Removes horizontal numPixels rows.
    % Loop through number of pixels to be removed.
    for a = 1: numPixels
        % Find rows and new_cols of image (remove 1 row on each loop).
        new_rows = size(img,1)-1;
        cols = size(img,2);
        % Make new image (3 channel for color).
        new_img = zeros(new_rows,cols,3);
        % Find the vertical min energy as well as the seam.
        horiz_min_map = horiz_min_energy_map(energy_calculator(img));
        h_seam = horiz_seam_finder(horiz_min_map);
        % Loop through the cols to copy over old pixels to new image.
        for c = 1:cols
            % Grab index of seam, find pixels before and after the seam.
            seam_index = h_seam(c);
            pixels_before_seam = img(1:seam_index-1,c,:);
            pixels_after_seam = img(seam_index+1:end,c,:);
            % Assign the indices of 1: 1 before seam_index as well as
            % seam_index to the end with pixels before and after seam.
            new_img(1:seam_index-1,c,:) = pixels_before_seam;
            new_img(seam_index:end,c,:) = pixels_after_seam;
        end
        % Cast new_img to a uint8, assign [img] to new_img, continue loop.
        new_img = uint8(new_img);
        [img] = new_img;
    end
end