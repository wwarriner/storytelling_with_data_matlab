function lh = sline( axh )

min_val = min( axh.XLim( 1 ), axh.YLim( 1 ) );
max_val = max( axh.XLim( 2 ), axh.YLim( 2 ) );
range = [ min_val max_val ];

lh = line( axh, range, range );

end

