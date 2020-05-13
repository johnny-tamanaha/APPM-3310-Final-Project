function [e_predicted] = predict_e(year)
% Calculate the predicted e vector for a given year 
   E = zeros(15, 22);
   for i = 1:22
        [~, e] = predict_pro2(string(i+1996));
        E(:, i) = e;
   end
   e_predicted = zeros(15, 1);
   pfit1 = polyfit(1997:2018, E(1,:), 1);
   e_predicted(1) = pfit1(2) + pfit1(1)*year;

   pfit2 = polyfit(1997:2018, E(2,:), 1);
   e_predicted(2) = pfit2(2) + pfit2(1)*year;
   
   pfit3 = polyfit(1997:2018, E(3,:), 1);
   e_predicted(3) = pfit3(2) + pfit3(1)*year;

   X = horzcat(ones(22, 1), (1997:2018)', sin(1997:2018)');
   y = E(4,:)';
   XTX_inv = inv(mtimes(transpose(X), X));
   x_best = mtimes(mtimes(XTX_inv, transpose(X)), y);
   e_predicted(4) = x_best(1, 1) + x_best(2, 1)*year + x_best(3, 1)*sin(year);
   
   X = horzcat(ones(22, 1), (1997:2018)', sin(1997:2018)');
   y = E(5,:)';
   XTX_inv = inv(mtimes(transpose(X), X));
   x_best = mtimes(mtimes(XTX_inv, transpose(X)), y);
   e_predicted(5) = x_best(1, 1) + x_best(2, 1)*year + x_best(3, 1)*sin(year);
   
   pfit6 = polyfit(1997:2018, E(6,:), 1);
   e_predicted(6) = pfit6(2) + pfit6(1)*year;
   pfit7 = polyfit(1997:2018, E(7,:), 1);
   e_predicted(7) = pfit7(2) + pfit7(1)*year;
   pfit8 = polyfit(1997:2018, E(8,:), 1);
   e_predicted(8) = pfit8(2) + pfit8(1)*year;
   pfit9 = polyfit(1997:2018, E(9,:), 1);
   e_predicted(9) = pfit9(2) + pfit9(1)*year;
   pfit10 = polyfit(1997:2018, E(10,:), 1);
   e_predicted(10) = pfit10(2) + pfit10(1)*year;
   pfit11 = polyfit(1997:2018, E(11,:), 1);
   e_predicted(11) = pfit11(2) + pfit11(1)*year;
   pfit12 = polyfit(1997:2018, E(12,:), 1);
   e_predicted(12) = pfit12(2) + pfit12(1)*year;
   pfit13 = polyfit(1997:2018, E(13,:), 1);
   e_predicted(13) = pfit13(2) + pfit13(1)*year;
   pfit14 = polyfit(1997:2018, E(14,:), 1);
   e_predicted(14) = pfit14(2) + pfit14(1)*year;
   pfit15 = polyfit(1997:2018, E(15,:), 1);
   e_predicted(15) = pfit15(2) + pfit15(1)*year;
end
