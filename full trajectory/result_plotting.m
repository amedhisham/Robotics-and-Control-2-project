parameters;

% Data
x_tracking = out.x_tracking.signals.values;
y_tracking = out.y_tracking.signals.values;

t_x = out.x_err_b.time;
x_data = out.x_err_b.signals.values;

t_y = out.y_err_b.time;
y_data = out.y_err_b.signals.values;

t_th = out.th_err_b.time;
th_data = out.th_err_b.signals.values;

ro_data = out.ro.signals.values;
gamma_data = out.gamma.signals.values;
delta_data = out.delta.signals.values;

t_ro = out.ro.time;
t_gamma = out.gamma.time;
t_delta = out.delta.time;


plot(x_tracking, y_tracking, 'LineWidth', 2);
ylabel('y'); xlabel('x');
str = {['a = ', num2str(a)], ['\xi = ',num2str(ksi)], ...
    ['K1 = ', num2str(k1_reg)], ['K2 = ',num2str(k2_reg)],['K3 = ', num2str(k3_reg)]};
text(0.95, 0.98, str, 'Units', 'normalized', ...
    'VerticalAlignment', 'top', 'HorizontalAlignment', 'right', ...
    'FontSize', 12);
axis equal;

 plot(t_th, th_data, 'LineWidth', 2);
            ylabel('theta Angle Error'); xlabel('Time (s)');
            str = {['a = ', num2str(a)], ['\xi = ',num2str(ksi)], ... 
                ['K1 = ', num2str(k1_reg)], ['K2 = ',num2str(k2_reg)],['K3 = ', num2str(k3_reg)]};
            text(0.95, 0.98, str, 'Units', 'normalized', ...
            'VerticalAlignment', 'top', 'HorizontalAlignment', 'right', ...            
            'FontSize', 12);

% 
% % Figure Names
% names = {"x error (B)", "y error (B)", "theta error (B)", "Position tracking", "ro", "gamma", "delta"};
% 
% for i = 1:7
% 
%     fig = figure('Name', names{i}, 'NumberTitle', 'off');
% 
%     switch i
%         case 1
%             plot(t_x, x_data, 'LineWidth', 2);
%             ylabel('x Position Error'); xlabel('Time (s)');
%             str = {['a = ', num2str(a)], ['\xi = ',num2str(ksi)], ... 
%                 ['K1 = ', num2str(k1_reg)], ['K2 = ',num2str(k2_reg)],['K3 = ', num2str(k3_reg)]};
%             text(0.95, 0.98, str, 'Units', 'normalized', ...
%             'VerticalAlignment', 'top', 'HorizontalAlignment', 'right', ...            
%             'FontSize', 12);
%         case 2
%             plot(t_y, y_data, 'LineWidth', 2);
%             ylabel('y Position Error'); xlabel('Time (s)');
%             str = {['a = ', num2str(a)], ['\xi = ',num2str(ksi)], ... 
%                 ['K1 = ', num2str(k1_reg)], ['K2 = ',num2str(k2_reg)],['K3 = ', num2str(k3_reg)]};
%             text(0.95, 0.98, str, 'Units', 'normalized', ...
%             'VerticalAlignment', 'top', 'HorizontalAlignment', 'right', ...            
%             'FontSize', 12);
%         case 3
%             plot(t_th, th_data, 'LineWidth', 2);
%             ylabel('theta Angle Error'); xlabel('Time (s)');
%             str = {['a = ', num2str(a)], ['\xi = ',num2str(ksi)], ... 
%                 ['K1 = ', num2str(k1_reg)], ['K2 = ',num2str(k2_reg)],['K3 = ', num2str(k3_reg)]};
%             text(0.95, 0.98, str, 'Units', 'normalized', ...
%             'VerticalAlignment', 'top', 'HorizontalAlignment', 'right', ...            
%             'FontSize', 12);
%         case 4
%             plot(x_tracking, y_tracking, 'LineWidth', 2);
%             ylabel('y'); xlabel('x');
%             str = {['a = ', num2str(a)], ['\xi = ',num2str(ksi)], ... 
%                 ['K1 = ', num2str(k1_reg)], ['K2 = ',num2str(k2_reg)],['K3 = ', num2str(k3_reg)]};
%              text(0.95, 0.98, str, 'Units', 'normalized', ...
%             'VerticalAlignment', 'top', 'HorizontalAlignment', 'right', ...            
%             'FontSize', 12);
%             axis equal;
%         case 5
%             plot(t_ro, ro_data, 'LineWidth', 2);
%             ylabel('ro'); xlabel('Time (s)');
%             str = {['a = ', num2str(a)], ['\xi = ',num2str(ksi)], ... 
%                 ['K1 = ', num2str(k1_reg)], ['K2 = ',num2str(k2_reg)],['K3 = ', num2str(k3_reg)]};
%             text(0.95, 0.98, str, 'Units', 'normalized', ...
%                 'VerticalAlignment', 'top', 'HorizontalAlignment', 'right', ...
%                 'FontSize', 12);
%         case 6
%             plot(t_gamma, gamma_data, 'LineWidth', 2);
%             ylabel('gamma'); xlabel('Time (s)');
%             str = {['a = ', num2str(a)], ['\xi = ',num2str(ksi)], ... 
%                 ['K1 = ', num2str(k1_reg)], ['K2 = ',num2str(k2_reg)],['K3 = ', num2str(k3_reg)]};
%             text(0.95, 0.98, str, 'Units', 'normalized', ...
%                 'VerticalAlignment', 'top', 'HorizontalAlignment', 'right', ...
%                 'FontSize', 12);
%         case 7
%             plot(t_delta, delta_data, 'LineWidth', 2);
%             ylabel('delta'); xlabel('Time (s)');
%             str = {['a = ', num2str(a)], ['\xi = ',num2str(ksi)], ... 
%                 ['K1 = ', num2str(k1_reg)], ['K2 = ',num2str(k2_reg)],['K3 = ', num2str(k3_reg)]};
%             text(0.95, 0.98, str, 'Units', 'normalized', ...
%                 'VerticalAlignment', 'top', 'HorizontalAlignment', 'right', ...
%                 'FontSize', 12);
%     end
% 
% 
%     title(strrep(names{i}, '_', ' '));
%     grid on;
% 
%     % Save to directory
%     filename = sprintf('%s a%d ksi%.3f.png', char(names{i}), a, ksi);
%     fullPath = fullfile('/home/federico/matlab/ReC2/combined/Simulations_Results', filename);
% 
%     saveas(fig, fullPath);
%     close(fig)
% 
% end