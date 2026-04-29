clc;
clear;
close all;

disp('=== Adaptive Budget Analyzer ===');

%% ---------------- INPUT ----------------
expenses = input('Enter monthly expenses (e.g. [2000 2500 2700]): ');
income = input('Enter monthly income: ');

% time index (1,2,3,...)
t = (1:length(expenses))';

t_new = length(expenses) + 1;

%% ---------------- VALIDATION ----------------
[expenses, t] = validate_data(expenses, t);

%% ---------------- REGRESSION ----------------
theta = regression_engine(t, expenses);

predicted = theta(1) + theta(2)*t_new;

%% ---------------- STABILITY ----------------
stability = stability_engine(expenses);

%% ---------------- RISK ----------------
risk = risk_engine(predicted, income);

%% ---------------- DECISION ----------------
status = decision_engine(stability, risk);

%% ---------------- OUTPUT ----------------
disp(' ');
disp('--- RESULTS ---');
disp(['Predicted Expense: ', num2str(predicted)]);
disp(['Stability Score: ', num2str(stability)]);
disp(['Risk Score: ', num2str(risk)]);
disp(['Final Decision: ', status]);

%% ---------------- VISUALIZATION ----------------
visualization_engine(t, expenses, theta, t_new, predicted, stability);
:::
