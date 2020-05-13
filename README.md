# APPM-3310-Final-Project

Matrix Methods Final Project: Input-output matricies and the Leontiff input-output model

Applications:
  
  1. Solve incompatible cases
  
    pinverse and projection are two methods for solutions. solvex displays both solutions with one script.
  2. Predict total demand
  
    Using data from the 1997-2018 xlsx file, data extract pulls the matrix/vector pairs from specific sheets. predict_e predicted the external demand in a given year. predict_x_single predicts the total demand in one year given the ISC matrix of another year and predict_x_range repreats the prediction process for all years after the given year. stability calculates the stability of each years ISC matrix and stable_predict gives somewhat stable prediction of future year total demand vectors using stability and predict_e for future years. 
