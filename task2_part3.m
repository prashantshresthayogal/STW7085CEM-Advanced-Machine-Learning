rng(42); % Set random seed

% Define optimization problem
num_params = length(error_mf) + length(change_in_error_mf) + length(output_mf);
fitnessfcn = @(params) evaluate_fitness(params, error_mf, change_in_error_mf, output_mf);

% Define fminsearch options
options = optimset('Display', 'iter', 'MaxIter', 20);

% Run fminsearch
best_params = fminsearch(fitnessfcn, rand(1, num_params), options);

% Display results
disp(['Best Individual''s Parameters: ' num2str(best_params)]);

% Update membership functions
update_membership_functions(best_params, error_mf, change_in_error_mf, output_mf);

% Plot membership functions after optimization
figure;
subplot(3, 1, 1);
plotmf(flc, 'input', 1);
title('Error Membership Functions after Optimization');
subplot(3, 1, 2);
plotmf(flc, 'input', 2);
title('Change_in_Error Membership Functions after Optimization');
subplot(3, 1, 3);
plotmf(flc, 'output', 1);
title('Output Membership Functions after Optimization');
