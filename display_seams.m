function img = display_seams(rgb_img, vert, horiz)
%DISPLAY_SEAMS Function to display seams.
    img_copy = rgb_img;
    if vert > 0
        % Find vert amount of row vectors.
        shrunk_img = rgb_img;
        new_mat = zeros(size(rgb_img,1), vert);
        % Recalculate seam after 'removing' it (adding to matrix of seams).
        for i = 1:vert
            % Find vertical seam.
            vert_map = vert_min_energy_map(energy_calculator(shrunk_img));
            vert_seam = vert_seam_finder(vert_map);
            new_mat(:,i) = vert_seam;
            [shrunk_img] = removeVertical(shrunk_img, 2);
        end
        % Loop through matrix of removed row vectors, color pixels red.
        for r = 1:size(new_mat,1)
            for c = 1:size(new_mat,2)
                % Set pixels to red (RGB of [255,0,0]).
                img_copy(r,new_mat(r,c),1:3) = [255,0,0];
            end
        end
    end
    if horiz > 0
        % Find horiz amount of column vectors.
        shrunk_img = rgb_img;
        new_mat = zeros(horiz, size(rgb_img,2));
        % Recalculate seam after 'removing' it (adding to matrix of seams).
        for i = 1:horiz
            % Find horizontal seam.
            horiz_map = horiz_min_energy_map(energy_calculator(shrunk_img));
            horiz_seam = horiz_seam_finder(horiz_map);
            new_mat(i,:) = horiz_seam;
            [shrunk_img] = removeHorizontal(shrunk_img, 2);
        end
        % Loop through matrix of removed column vectors, color pixels red.
        for r = 1:size(new_mat,1)
            for c = 1:size(new_mat,2)
                % Set pixels to red (RGB of [255,0,0]).
                img_copy(new_mat(r,c),c,1:3) = [255,0,0];
            end
        end 
    end
    img = img_copy;
end