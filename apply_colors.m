function apply_colors( axh, emph_inds )

children = axh.Children;
g_count = numel( children );
if g_count == 0
    return
end

colors = Colors();

if any( emph_inds > 0 )
    logical_inds = false( g_count, 1 );
    logical_inds( emph_inds ) = true;
    emph_inds = logical_inds;
end

if g_count == 1
    children.CData( emph_inds ) = colors.BLUE;
    children.CData( ~emph_inds ) = colors.LIGHT_GRAY;
elseif g_count > 1
    for i = 1 : numel( emph_inds )
        
        ei = emph_inds( i );
        child = children( i );
        prop = [];
        if isprop( child, 'CData' )
            prop = 'CData';
        elseif isprop( child, 'Color' )
            prop = 'Color';
        else
            assert( false )
        end
        
        if ei
            child.(prop) = colors.BLUE;
        else
            child.(prop) = colors.LIGHT_GRAY;
        end
        
    end
end

end

