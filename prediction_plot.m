% Plot predicted and actual models from 1997, 2000, 2008, and 2009

[y1997, a1997, p1997] = predict_x_range(1997);
fprintf("1997\n")
[y2008, a2008, p2008] = predict_x_range(2008);
fprintf("2008\n")
[y2009, a2009, p2009] = predict_x_range(2009);
fprintf("2009\n")

plot(y1997, a1997);
hold on;
plot(y1997, p1997);
hold on;
plot(y2008, p2008);
hold on;
plot(y2009, p2009);
hold on;

[p2019, l2019, u2019] = stable_predict(2019);
fprintf("2019\n")
[p2020, l2020, u2020] = stable_predict(2020);
fprintf("2020\n")
scatter([2019, 2020], [sum(p2019), sum(p2020)], 'MarkerEdgeColor', [0, 0, 0], 'MarkerFaceColor', [0, 0, 0]);
hold on;
plot([2019, 2019], [sum(l2019), sum(u2019)], 'k');
hold on;
plot([2020, 2020], [sum(l2020), sum(u2020)], 'k');
legend('Actual','1997', '2008', '2009', 'Future Predictions');
% xlabel('Year')
% ylabel('Sum of Total Demand')
% legend('Actual', '1997', '2008', '2009')