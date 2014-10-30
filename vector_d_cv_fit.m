function fitness = vector_d_cv_fit(coeffs)
    global renorm_cp_low_pressure
    fitness = sum(abs(ErrorVector1d(coeffs,renorm_cp_low_pressure)));
end