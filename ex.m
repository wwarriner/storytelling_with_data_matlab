acc = [ ...
    99.9 99.2 98.1 98.5 96.7 96.1; ...
    99.0 97.4 95.7 97.1 95.6 89.2; ...
    98.0 92.0 98.6 98.3 46.5 16.5; ...
    96.1 74.6 84.6 84.0 91.9 69.8 ...
    ];
n_pos = [ 33 25 20 15 10 5 ];
n_neg = 350;
n_tot = n_pos + n_neg;
f_pos = n_pos ./ n_tot;
p_pos = f_pos .* 100;
classes = { ...
    'Seg/Dec Net'; ...
    'Cognex ViDi Suite'; ...
    'DeepLab v3+'; ...
    'U-Net' ...
    };

fh = figure();
fh.Color = 'w';
fh.Position( 1 : 2 ) = [ 50 50 ];

axh = axes( fh );
hold( axh, 'on' );
axh.ActivePositionProperty = 'outerposition';
axh.Units = 'pixels';
axh.XTick = [ min( p_pos ) max( p_pos ) ];
axh.XLim = [ min( p_pos ) max( p_pos ) ];
axh.XLabel.String = {'Defective', 'Training Samples'};
axh.YTick = [ 0 100 ];
axh.YLim = [ 0 100 ];
axh.YLabel.String = {'Accuracy '};

row_count = numel( classes );
col_count = numel( n_pos );
y_inds = 1 : col_count;
plot( ...
    axh, ...
    p_pos( y_inds ), ...
    acc( :, y_inds ) ...
    );

apply_colors( axh, 1 );
apply_axis_formats( axh, 'full' );
axh.YAxis.TickLabelFormat = '%i%%';
axh.XAxis.TickLabelFormat = '%.1f%%';

ch = axh.Children( end );
ch.LineWidth = 2;

right = axh.XLim( end ) + 0.025 * diff( axh.XLim );
th = text( ...
    axh, ...
    right, ...
    ch.YData( end ) * 1.012, ...
    'Seg/Dec Net' ...
    );
th.HorizontalAlignment = 'left';
th.VerticalAlignment = 'bottom';
th.FontSize = 18;
th.FontName = 'calibri';
cc = Colors();
th.Color = cc.BLUE;

lh = hline( axh, 100 );
lh.LineStyle = '--';
lh.LineWidth = 1;
lh.Color = 'k';

fh.Position( 3 : 4 ) = 1.5 * fh.Position( 3 : 4 );
axh.Position( 1 : 2 ) = axh.Position( 1 : 2 ) + 0.5 * fh.Position( 3 : 4 ) - 0.5 * axh.Position( 3 : 4 );
