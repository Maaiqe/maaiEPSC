function [Rsq, Rsq_adj]=CalcRsq(yData,residuals,NfuncVars)
% calculates Rsq and adjusted Rsq from lsqfit
% example:  [Rsq, Rsq_adj]=CalcRsq(decayY,lsq1.residual,lsq1.xfunc)

if nargin<2
    disp('Too few input arguments')
else
    if numel(NfuncVars)>1
        NfuncVars=numel(NfuncVars);
    end
    
    if ~(numel(residuals)==numel(yData))
        disp('Size of yData and residuals should be the same')
    else
        yData=yData(:);
        residuals=residuals(:);
        meanY=mean(yData);
        SSres=sum((residuals).^2);
        SStot=sum((yData-repmat(meanY,size(yData))).^2);
        Rsq=1-(SSres/SStot);
        Rsq_adj=1-(1-Rsq)*((numel(yData)-1)/(numel(yData)-NfuncVars-1));
    end
end
end

