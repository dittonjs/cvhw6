% implementation structured from https://stackoverflow.com/questions/26332883/how-to-find-all-connected-components-in-a-binary-image-in-matlab
function [labelim, num] = FindComponentLabels(inputim, se)
    labelim = zeros(size(inputim));
    label = 0;
    p=find(inputim==1);
    p=p(1);

    while(~isempty(p))
        label=label+1;
        p=p(1);
        X=false(size(inputim));
        X(p)=1;

        Y=inputim & imdilate(X,se);
        while(~isequal(X,Y))
            X=Y;
            Y=inputim & imdilate(X,se);
        end

        pos=find(Y==1);

        inputim(pos)=0;
        labelim(pos)=label;

        p=find(inputim==1);

    end
    
    labelim = uint8((labelim ./ label) .* 255);
    num = label;
end

