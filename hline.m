function handle = hline( axh, intercept )

handle = line( ...
    axh.XLim, ...
    [ intercept intercept ] ...
    );

end

