function stability = stability_engine(y)

sigma = std(y);

stability = 1 / (1 + sigma);

end
