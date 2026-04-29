function risk = risk_engine(predicted, income)

if income == 0
error('Income cannot be zero');
end

risk = predicted / income;

end
