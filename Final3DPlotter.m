clear all
%cd C:\Users\User\PycharmProjects\lab_c\quantum_cryptography\simulations\tomography\HVVH
filename='Simulation_angle_bar_data_base_HHVV_bit_num_10';
base=filename(32:35);
%base = "HHVV";
bit_num=filename(45:46);
%bit_num = "500";
%title_figure=strcat('Simulation base',{' '},base,{' '},bit_num,' bits');
title_figure=strcat(base,{' '},bit_num,' bits');

%title_figure=strcat('Measements 2',{' '},num2str(bit_num),{' '},'bits HHVV')
data=readmatrix(strcat(filename,'.csv'));
Li=["HH","HV","VH","VV"];
Ls=["HH","HV","VH","VV"];

fig=figure;

G2_plot=bar3(data(1:4,1:4));
for k = 1:length(G2_plot)
    zdata = G2_plot(k).ZData;
    G2_plot(k).CData = zdata;
    G2_plot(k).FaceColor = 'interp';
end
titles_size=25;
set(gca,'FontWeight','bold')
set(gca,'FontName','Times New Roman')
set(gca,'Fontsize',15)
set(gca,'XTickLabel',((Li)));
%xlabel('u');
%xlabel('$\vert \psi \rangle$','Interpreter','latex','FontName','Times New Roman','FontSize',titles_size);
set(gca,'YTickLabel',((Ls)));
%ylabel('j');
%ylabel('meas. state','FontName','Times New Roman','FontSize',titles_size);
%                title(num2str([d,d2]));
title(title_figure,'FontName','Times New Roman','FontSize',titles_size);
colormap default;
               
%zticks([0:0.2:0.6]);
high_array=max(data);
high_num=max(high_array);
set(gca,'Ztick',round([0:(high_num/3):high_num],2));
savefig(filename);
%filename=strrep(title_figure,' ','_')
%filename=char(strcat(filename,'.fig'))
%savefig(fig,filename)
