function apply_axis_formats( axh, x_fmt, y_fmt )

NONE = 'none';
PLAIN = 'plain';
FULL = 'full';

COLOR = [ 0.3 0.3 0.3 ];
FONT_NAME = 'arial';
FONT_SIZE = 18;
FORMAT = '%.1f';

if nargin < 3
    y_fmt = x_fmt;
end

axh.Box = 'off';
axh.TickDir = 'out';
axh.FontName = FONT_NAME;
axh.FontSize = FONT_SIZE;
axis( axh, 'square' );

fmts = { x_fmt, y_fmt };
axs = { 'X', 'Y' };
for i = 1 : numel( fmts )
    apply( fmts{ i }, axs{ i } );
end

    function apply( fmt, axis )
        prop = sprintf( '%sAxis', axis );
        ruler = axh.(prop);
        ruler.Color = COLOR;
        if any( fix( ruler.TickValues ) ~= ruler.TickValues )
            ruler.TickLabelFormat = FORMAT;
        else
            ruler.TickLabelFormat = '%i';
        end
        switch fmt
            case NONE
                ruler.Visible = 'off';
            case PLAIN
                ruler.Visible = 'off';
                ruler.Axle.Visible = 'on';
            case FULL
                ruler.Visible = 'on';
            otherwise
                assert( false )
        end
    end

end

