function [ features ] = features_init()
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    features = data_init();
    
    features.static.power.std=[];
    features.static.power.mean=[];
    features.static.power.median=[];
    
    features.static.phase.std=[];
    features.static.phase.mean=[];
    features.static.phase.median=[];
    
    features.dynamic.V.I.power.std = [];
    features.dynamic.V.I.power.mean = [];
    features.dynamic.V.I.power.median = [];
    
    features.dynamic.V.U.phase.std = [];
    features.dynamic.V.U.phase.mean = [];
    features.dynamic.V.U.phase.median = [];
    
    features.dynamic.V.P.power.std = [];
    features.dynamic.V.P.power.mean = [];
    features.dynamic.V.P.power.median = [];
    
    
    features.dynamic.H.I.power.std = [];
    features.dynamic.H.I.power.mean = [];
    features.dynamic.H.I.power.median = [];
    
    features.dynamic.H.U.phase.std = [];
    features.dynamic.H.U.phase.mean = [];
    features.dynamic.H.U.phase.median = [];
    
    features.dynamic.H.P.power.std = [];
    features.dynamic.H.P.power.mean = [];
    features.dynamic.H.P.power.median = [];
    

end

