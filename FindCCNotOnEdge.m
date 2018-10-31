function [newim] = FindCCNotOnEdge(inputim)
    se = [ 1 1 1; 1 1 1; 1 1 1];
    im2 = inputim;
    [rows ,cols] = size(inputim);
    im2(2:rows-1, 2:cols-1) = 0;
    p=find(im2==1);
    p=p(1);
    edgeimage = zeros(size(im2))
    while(~isempty(p))
        p=p(1);
        X=false(size(inputim));
        X(p)=1;

        Y=inputim & imdilate(X,se);
        while(~isequal(X,Y))
            X=Y;
            Y=inputim & imdilate(X,se);
        end

        pos=find(Y==1);

        im2(pos)=0;
        edgeimage(pos)=1;

        p=find(im2==1);

    end
    
    newim = logical(inputim - edgeimage);
end
