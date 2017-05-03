function [ new_video ] = duplicateFRUC( video, ratio )
%solves the FRUC problem by duplicating frames

    [height,width,original_frame_rate] = size(video);
    new_frame_rate = original_frame_rate * ratio;
    new_video = zeros(height,width,new_frame_rate);
    counter = 1;
    frame = 1;

%     disp(original_frame_rate)
    
    for i=1:1:new_frame_rate
        new_video( :, :, i) = video( :, :, frame);
        if counter == ratio
            counter = 1;
            frame = frame + 1;
        else
            counter = counter + 1;
        end
    end
    
%     disp(frame)
end

