function fitness = vector_d_cv_fit(coeffs)
    global renorm_cp
    fitness = sum(abs(ErrorVector1d(coeffs,[renorm_cp(:,1),renorm_cp(:,3)])));
end