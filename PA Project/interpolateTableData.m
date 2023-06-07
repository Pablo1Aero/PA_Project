% Interpolator

function interpolatedData  = interpolateTableData(x, y, queryPoints)
    % x: x-coordinates of the table data
    % y: y-coordinates of the table data
    % queryPoints: x-coordinates of the points to be interpolated
    
    if numel(x) ~= numel(y)
        error('x and y must have the same lenght');
    end
    
    % Perform interpolation
    interpolatedData = interp1(x, y, queryPoints, 'linear');

end

