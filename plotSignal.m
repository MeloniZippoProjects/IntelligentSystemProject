time_dyn = Inventario.Tag598BD.TempoTag;
power_dyn = Inventario.Tag598BD.RSSITag;
phase_dyn = Inventario.Tag598BD.FaseTag;

time_stat = Inventario.Tag598B6.TempoTag;
power_stat = Inventario.Tag598B6.RSSITag;
phase_stat = Inventario.Tag598B6.FaseTag;

f = figure('Name', 'Power');
hold on;
plot(time_dyn, power_dyn, 'DisplayName', 'Power Dynamic');
%plot(time_stat, power_stat, 'DisplayName', 'Power Static');
%plot(time, phase, 'DisplayName', 'Phase');
legend('show');
hold off;

f2 = figure('Name', 'Phase');
hold on;
plot(time_dyn, phase_dyn, 'DisplayName', 'Phase Dynamic');
%plot(time_stat, phase_stat, 'DisplayName', 'Power Static');
%plot(time, phase, 'DisplayName', 'Phase');
legend('show');
hold off;

