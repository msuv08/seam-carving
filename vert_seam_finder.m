function v_seam_indices = vert_seam_finder(min_energy_map)
%VERT_SEAM_FINDER Finds the lowest energy vertical seam.
    rows = size(min_energy_map,1);
    v_seam_indices = zeros(rows,1);
    cols = size(min_energy_map,2);

    [~, min_index] =  min(min_energy_map(rows,:));
    v_seam_indices(rows) = min_index;
    loop_back = -1;
    % Loop through the row backwards
    for r = (rows-1:loop_back:1)
        % General case: inside bounds, 3 available neighbors to pick from
        if min_index ~= 1 && min_index ~= cols
            % 3-connected neighbors to backtrack from
            top_left_neighbor = min_energy_map(r,v_seam_indices(r+1)-1);
            above_neighbor = min_energy_map(r,v_seam_indices(r+1));
            top_right_neighbor = min_energy_map(r,v_seam_indices(r+1)+1);
            [~,col] =  min([top_left_neighbor above_neighbor top_right_neighbor]);
        % Edge case 1: At first col, only two available neighbors to pick from
        elseif min_index == 1
            % Only two neighbors (above and right) to pick from
            above_neighbor = min_energy_map(r,min_index);
            diag_right_neighbor = min_energy_map(r,min_index+1);
            [~,col] = min([above_neighbor, diag_right_neighbor]);
            col = col+1;
        % Edge case 2: At last col, only two available neighbors to pick from
        else
            % Only two neighbors (above and left) to pick from
            above_neighbor = min_energy_map(r,min_index);
            diag_left_neighbor = min_energy_map(r,min_index-1);
            [~,col] = min([diag_left_neighbor, above_neighbor]);
        end
        % Assign min_index based on which direction has least energy
        switch col
            case 1
                % Left pixel has min energy
                min_index = v_seam_indices(r+1)-1;
            case 3
                % Right pixel has min energy
                min_index = v_seam_indices(r+1)+1;
            otherwise
                % Pixel directly above has min energy
                min_index = v_seam_indices(r+1);
        end
        % Set v_seam_indices at r
        v_seam_indices(r) = min_index;
    end

end