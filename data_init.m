function [ data ] = data_init()
    data = struct();

    data.static.power = {};
    data.static.phase = {};
    data.static.timestamps = {};
    
    data.dynamic.V.I.power = {};
    data.dynamic.V.I.phase = {};
    data.dynamic.V.I.timestamps = {};
    
    data.dynamic.V.U.power = {};
    data.dynamic.V.U.phase = {};
    data.dynamic.V.U.timestamps = {};
    
    data.dynamic.V.P.power = {};
    data.dynamic.V.P.phase = {};
    data.dynamic.V.P.timestamps = {};
    
	data.dynamic.H.I.power = {};
    data.dynamic.H.I.phase = {};
    data.dynamic.H.I.timestamps = {};
    
    data.dynamic.H.U.power = {};
    data.dynamic.H.U.phase = {};
    data.dynamic.H.U.timestamps = {};
    
    data.dynamic.H.P.power = {};
    data.dynamic.H.P.phase = {};
    data.dynamic.H.P.timestamps = {};
end

