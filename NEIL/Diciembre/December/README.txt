
// Experiment specifications:
YFP and CFP are in polycistronic arrange under pT7 promoter, and
T7-polymerase  is under pLac (say, expresed in IPTG presence).

///This is the polycistronic-arrange:

promoT7->toehold--hairping--YFP-*-1/2toehold-ascontrol-RBS-CFP-|TerT7

(and it is cloned into a single-copy plasmid!)

//Moreover, the system is Toehold regulated.
Say, YFP mRNA is traduced only in presence of the trigger RNA, while CFP is constetutive.
///The triger is also transcribed from T7-promoter (induced with IPTG).
The trigger is co-transformed into LOW or HIGH copy number plasmids.

So We have 6 conditions:

% 1: S1YC + Empty plasmid
% 2: S1YC + Empty plasmid + IPTG
% 3: S1YC + T-Low copy
% 4: S1YC + T-Low copy + IPTG
% 5: S1YC + T-High copy
% 6: S1YC + T-High copy + IPTG

%Strain: E.coli Bl21 Star  ---> RNAses-free

% 3 biological replicas (datasets A, B, C)

%%The first objective is to fit a kinetic model for OD/Time.
%%
LBS program
//one-to-six

directive simulation deterministicstiff
directive sample 700.0 1000
directive plot OD
directive time minutes
directive parameters
  [ r,(1.0e-3,1.0),0.02,log,multiple
  ; K,(0.0,1.0),0.7,real,multiple
  ; x0,(1e-4,1e0),1e-3,log,random
  ; b0,(0.0,0.1),0.05,real,random]

directive sweep sweepMetabCharge = { gr = [1,2,3,4,5,6] }
//I decided to sweep every possible condition.
directive fit {sweepMetabCharge; unoalseis; x+back}
//data sets are unoalseis, unoalseisB, unoalseisC
directive fit_run {burnin=5000; samples=5000}

init x x0 |
init back b0 |
->[r*x*(1--x/K)] x

%%
We were talking about trying to "separate" genotype-metabolic effects.
I changed K and R to evaluate the model.

a) if r=random ->  It will estimate only one r that will be fitted in every condition
RESULTS: AIC, BIC, DIC -1700 and MaxLH 900
         it fitted properlly 1,3,5 (-IPTG) and very  poorlly the +IPTG ones.
->Does it means that IPTG modulate r ?

b) if k=random -> It will be estimated a single value of carring capacity for every condition.
-> all bacterias can grow untill they reach the same OD.
RESULTS: AIC, BIC, DIC -2020 and MaxLH 100

c) if r and K =multiple -> RESULTS: AIC, BIC, DIC -2500 and MaxLH 1293
This is the best model we run 30000 simulations. Got the data of the 3 datasets A, B, C
Work-in-progress annalysis, scatterplots, statistics ? in Matlab. ¿How can I use this data to see separated effects of metabolism v/s genotipe?
Metabolism is the interaction with IPTG. And the genotype ( differences in growing should´t be evident -IPTG but maybe in +IPTG.


How can I use this data to understand the toehold mechanism ??-> complete model ?

At the end I just played arround with Datasets that incorporated OD, CFP, YFP for all the 6 conditions (datarep1 and questions.lbs)
I got confused.. variables and levels (Trigger copy number(0,H,L), IPTG(0,1) ) Can I do two sweeps in one LBS ?
.Is it necesary to fit everything in one big model ? or we can go fitting by-parts and use those estimations afterwards.


 //  NEWS: we have pT7-based Cell-free system. 
It runs in 5uL reaction. I've planed to run in plate reader with toeholds + dfferent trigger DNA in cell free so we can compare the parameters obtained... maybe there are intereting things. Can we use those models, and stimations for making hypothesis or predictions ?
Also, if we put a leaky parameter related to the probable self-activation  of the S1YC (YFP may be on a bit without trigger). Second generation ratiometric-toeholds may not be as leaky. ¿ Can we test this ?. NUPACK also is WIP.

