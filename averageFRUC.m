function [ new_video ] = averageFRUC(video)
%solves the FRUC problem by averging frames

    [height,width,original_frame_rate] = size(video);
    new_frame_rate = original_frame_rate * 2;
    new_video = zeros(height,width,new_frame_rate);

    for i=1:1:new_frame_rate-1
        if mod(i,2)==1
            new_video(:,:,i) = video(:,:,uint32(i/2));
        else
            new_video(:,:,i) = (video(:,:,uint32(i/2))+video(:,:,uint32(i/2)+1))/2;
        end
    end
    new_video(:,:,new_frame_rate) = video(:,:,original_frame_rate);
end

