function apply_axis_formats( axh, x_fmt, y_fmt )

NONE = 'none';
PLAIN = 'plain';
FULL = 'full';

cc = Colors();
COLOR = cc.DARK_GRAY;
FONT_NAME = 'calibri';
FONT_SIZE = 18;
FORMAT = '%.1f';

if nargin < 3
    y_fmt = x_fmt;
end


axh.Box = 'off';
axh.TickDir = 'out';
axh.FontName = FONT_NAME;
axh.FontSize = FONT_SIZE;

if numel( axh.YTick ) <= 2
    left = axh.XLim( 1 ) - 0.025 * diff( axh.XLim );
    th = text( ...
        axh, ...
        left, ...
        mean( axh.YLim ), ...
        axh.YLabel.String ...
        );
    th.HorizontalAlignment = 'right';
    th.FontName = FONT_NAME;
    th.FontSize = FONT_SIZE;
    th.Color = COLOR;
    axh.YLabel.Visible = 'off';
else
    axh.YLabel.Visible = 'on';
end

if numel( axh.XTick ) <= 2
    bottom = axh.YLim( 1 ) - 0.025 * diff( axh.YLim );
    th = text( ...
        axh, ...
        mean( axh.XLim ), ...
        bottom, ...
        axh.XLabel.String ...
        );
    th.HorizontalAlignment = 'center';
    th.VerticalAlignment = 'top';
    th.FontName = FONT_NAME;
    th.FontSize = FONT_SIZE;
    th.Color = COLOR;
    axh.XLabel.Visible = 'off';
else
    axh.XLabel.Visible = 'on';
end

%axis( axh, 'square' );

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
                ruler.Label.Visible = 'off';
            case PLAIN
                ruler.TickValues = [];
                ruler.Visible = 'off';
                ruler.Axle.Visible = 'on';
            case FULL
                ruler.Visible = 'on';
            otherwise
                assert( false )
        end
    end

end

