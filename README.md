# APPM-3310-Final-Project

Matrix Methods Final Project: Input-output matricies and the Leontiff input-output model

Applications:
  
  1. Solve incompatible cases
    
    pinverse -> solve using pseudoinverse
    projection -> solve using projections between subspaces (and finding solution with minimal norm)
    solvex -> disply solutions from pinverse and projection methods
  2. Predict total demand
    
    data_extract -> extract ISC/e matrix/vector pairs from a specific sheet
    predict_x_single -> predict the total demand in one year given the ISC matrix of another year
    predict_x_range -> predict the total demand in a range of years given the ISC matrix of the year before
    predict_e -> predicted external demand in a given year
    stability -> estimation of the stability of each year's ISC matrix
    stable_predict -> uses stable years and predicted external demand vectors to predict future total demand
