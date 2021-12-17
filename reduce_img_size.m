function reduced_img = reduce_img_size(img, width, height)
%REDUCE_IMG_SIZE Reduces image size.
    im2 = img;
    % Remove width vertical vectors, if needed.
    if width > 0
        [im2] = removeVertical(im2,width);
    end
    % Remove height horizontal vectors, if needed.
    if height > 0
        [im2] = removeHorizontal(im2,height);
    end
    reduced_img = im2;
end