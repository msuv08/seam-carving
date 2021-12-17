function [new_img] = removeVertical(img, numPixels)
%REMOVEVERTICAL Removes vertical numPixels columns.
%   Detailed explanation goes here
    % Loop through number of pixels to be removed.
    for a = 1: numPixels
        % Find rows and new_cols of image (remove 1 row on each loop).
        rows = size(img,1);
        new_cols = size(img,2)-1;
        % Make new image (3 channel for color).
        new_img = zeros(rows,new_cols,3);
        % Find the vertical min energy as well as the seam.
        vert_min_map = vert_min_energy_map(energy_calculator(img));
        v_seam = vert_seam_finder(vert_min_map);
        % Loop through the rows to copy over old pixels to new image.
        for r = 1:rows
            % Grab index of seam, find pixels before and after the seam.
            seam_index = v_seam(r);
            pixels_before_seam = img(r,1:seam_index-1,:);
            pixels_after_seam = img(r,seam_index+1:end,:);
            % Assign the indices of 1: 1 before seam_index as well as
            % seam_index to the end with pixels before and after seam.
            new_img(r,1:seam_index-1,:) = pixels_before_seam;
            new_img(r,seam_index:end,:) = pixels_after_seam;
        end
        % Cast new_img to a uint8, assign [img] to new_img, continue loop.
        new_img = uint8(new_img);
        [img] = new_img;
    end
end