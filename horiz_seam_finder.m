function h_seam_indices = horiz_seam_finder(min_energy_map)
%HORIZ_SEAM_FINDER Finds the lowest energy horizontal seam.
%   Detailed explanation goes here
    cols = size(min_energy_map,2);
    h_seam_indices = zeros(1,cols);
    rows = size(min_energy_map,1);

    [~, min_index] =  min(min_energy_map(:,cols));
    h_seam_indices(cols) = min_index;
    loop_back = -1;
    % Loop through the cols backwards
    for c = (cols-1:loop_back:1)
        % General case: inside bounds, 3 available neighbors to pick from
        if min_index ~= 1 && min_index ~= rows
            % 3-connected neighbors to backtrack from
            right_neighbor = min_energy_map(h_seam_indices(c+1),c);
            diag_top_neighbor = min_energy_map(h_seam_indices(c+1)+1,c);
            diag_bot_neighbor = min_energy_map(h_seam_indices(c+1)-1,c);
            [~,row] = min([diag_bot_neighbor right_neighbor diag_top_neighbor]);
        % Edge case 1: At first col, only two available neighbors to pick from
        elseif min_index == 1
            % Only two neighbors (east and southeast) to pick from
            east_neighbor = min_energy_map(min_index,c);
            southeast_neighbor = min_energy_map(min_index+1,c);
            [~,row] = min([east_neighbor, southeast_neighbor]);
            row=row+1;
        % Edge case 2: At last col, only two available neighbors to pick from
        else
            % Only two neighbors (east and northeast) to pick from
            northeast_neighbor = min_energy_map(min_index,c);
            east_neighbor = min_energy_map(min_index-1,c);
            [~,row] = min([east_neighbor, northeast_neighbor]);
        end
        % Assign min_index based on which direction has least energy
        switch row
            case 1
                % Left pixel has min energy
                min_index = h_seam_indices(c+1)-1;
            case 3
                % Right pixel has min energy
                min_index = h_seam_indices(c+1)+1;
            otherwise
                % Pixel to the right has min energy
                min_index = h_seam_indices(c+1);
        end
        % Set h_seam_indices at c 
        h_seam_indices(c)=min_index;

    end
end