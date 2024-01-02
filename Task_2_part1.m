% Fuzzy Logic Part (without Fuzzy Logic Toolbox)
error = linspace(-10, 10, 21);
change_in_error = linspace(-5, 5, 11);
output = linspace(-1, 1, 3);

% Fuzzy membership functions
error_mf = [
    (error <= -5) | ((error > -5) & (error <= 0) & (error >= -10)),
    (error > -5) & (error <= 5),
    ((error >= 0) & (error <= 5)) | (error > 5)
];

change_in_error_mf = [
    (change_in_error <= -3) | ((change_in_error > -3) & (change_in_error <= 0) & (change_in_error >= -5)),
    (change_in_error > -3) & (change_in_error <= 3),
    ((change_in_error >= 0) & (change_in_error <= 3)) | (change_in_error > 3)
];

output_mf = [
    (output <= 0) | ((output > 0) & (output <= 1) & (output >= -1)),
    (output > -1) & (output <= 1),
    (output >= 0) | ((output < 0) & (output >= -1))
];

% Set input values
input_error = -3;
input_change_in_error = 2;

% Fuzzy rule evaluation
rule1 = error_mf(1, input_error + 11) & change_in_error_mf(1, input_change_in_error + 6);
rule2 = (error_mf(2, input_error + 11) | error_mf(3, input_error + 11)) & change_in_error_mf(2, input_change_in_error + 6);
rule3 = error_mf(3, input_error + 11) & change_in_error_mf(3, input_change_in_error + 6);

% Fuzzy output calculation
output_low = min(output_mf(1, :));
output_medium = min(output_mf(2, :));
output_high = min(output_mf(3, :));

output_value = rule1 * output_low + rule2 * output_medium + rule3 * output_high;

% Display results
disp(['FLC Output: ' num2str(output_value)]);

% Plot membership functions (optional)
figure;
subplot(3, 1, 1);
plot(error, error_mf);
title('Error Membership Functions');
subplot(3, 1, 2);
plot(change_in_error, change_in_error_mf);
title('Change_in_Error Membership Functions');
subplot(3, 1, 3);
plot(output, output_mf);
title('Output Membership Functions');
