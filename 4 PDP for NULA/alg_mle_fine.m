function output = alg_mle_fine(estR, S_lambda, theta_b, resolution)
% refine into 0.0001;
    Nr = length(S_lambda);
    angle_all = -theta_b:0.2:theta_b;
    costml = zeros(1,length(angle_all));
    for ang_i = 1:length(angle_all)
        ttt = angle_all(ang_i);
        av = exp(1j*pi*S_lambda*sin(ttt/180*pi))';
        av = sqrt(Nr)*av/norm(av);       
        costml(ang_i) = av'*estR*av;
    end
%     [~,b] = max(abs(costml));
%     coarse = angle_all(b);
%     
%     angle_all = (-1:0.2:1) + coarse;
%     costml = zeros(1,length(angle_all));
%     for ang_i = 1:length(angle_all)
%         ttt = angle_all(ang_i);
%         av = exp(1j*pi*S_lambda*sin(ttt/180*pi))';
%         av = sqrt(Nr)*av/norm(av);       
%         costml(ang_i) = av'*estR*av;
%     end
    [a,b] = max(abs(costml));
    fine = angle_all(b);
    
    angle_all = (-0.2:resolution:0.2) + fine;
    costml = zeros(1,length(angle_all));
    for ang_i = 1:length(angle_all)
        ttt = angle_all(ang_i);
        av = exp(1j*pi*S_lambda*sin(ttt/180*pi))';
        av = sqrt(Nr)*av/norm(av);       
        costml(ang_i) = av'*estR*av;
    end
    [a,b] = max(abs(costml));
    output = angle_all(b);


end




