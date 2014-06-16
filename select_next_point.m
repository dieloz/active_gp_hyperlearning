function ind = select_next_point(map_hyperparameters, model, x, y, x_star)

  [~, ~, ~, f_star_variance_mgp, ...
   ~, ~, ~, f_star_variance_gp  ] = ...
      mgp(map_hyperparameters, model.inference_method, model.mean_function, ...
          model.covariance_function, model.likelihood, x, y, x_star);

  scores = f_star_variance_mgp ./ f_star_variance_gp;

  [~, ind] = max(scores);

end