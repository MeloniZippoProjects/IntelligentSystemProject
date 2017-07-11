function [ tagName ] = extractTagName( nota )
    tagExpression = '\(#\w+\)';

    [a, b] = regexp(nota, tagExpression);
    tagCode = nota(a+2 : b-1);
    if(size(tagCode) < 6)
        tagName = ['Tag5', tagCode];
    else
        tagName = ['Tag', tagCode];
    end  
end

