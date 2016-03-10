function VoxelStatsShow( stat_mat, image_dims )

    figure_layout_width_slices = 4;
    figure_layout_height_slices = 3;

    image_slices_n = image_dims(1);
    image_height_n = image_dims(2);
    image_width_n = image_dims(3);

    slice_start = round(image_slices_n/10);
    slices_showing_n = image_slices_n*0.8;
    slice_spacing = floor(slices_showing_n/(figure_layout_width_slices*figure_layout_height_slices));
    image_mat = zeros(image_height_n*3, image_width_n*4);

    stats_mat_3d_t = reshape(stats_mat, image_width_n , image_height_n, image_slices_n);
    stats_mat_3d = permute(stats_mat_3d_t, [2,1,3]);

    slices_count = 0;
    for i = 1:figure_layout_height_slices
        for j = 1:figure_layout_width_slices
            image_mat(image_height_n*(i-1)+1:image_height_n*i,image_width_n*(j-1)+1:image_width_n*j) = stats_mat_3d(:,:,slice_start+slices_count*slice_spacing);
            slice_count = slice_count +1;
        end
    end

    imagesc(image_mat); 
    colorbar; colormap(spectral(256));
    axis equal; axis off;  
    background='white';
    whitebg(gcf,background);
    set(gcf,'Color',background,'InvertHardcopy','off');

end

