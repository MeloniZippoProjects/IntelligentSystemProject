source_folder = 'dataset';
subfolders = {'dati_buoni'; 'dati_cattivi'};
target_folder = 'restructured_dataset';

root = pwd;

%static_tag = { 'Tag598B6'; };
%dynamic_tag = 'Tag598BD';


for subfolder_idx = 1 : size(subfolders, 1)
   subfolder = subfolders(subfolder_idx);
   
   curr_source_folder = fullfile(root, source_folder, subfolder);
   cd(curr_source_folder{1});
   
   data = features_init();
  
   matFiles = ( dir('**/*.mat') );
   
   for file_idx = 1 : size(matFiles, 1)
        filePath = fullfile(matFiles(file_idx).folder, matFiles(file_idx).name); 
        load(filePath);
   
        tagStatico = extractTagName(Nota_tag_statico);
                
        data.static.power = [ data.static.power, Inventario.(tagStatico).RSSITag ]; 
        data.static.phase = [ data.static.phase, Inventario.(tagStatico).FaseTag ]; 
   
        tagMobile = extractTagName(Nota_tag_mobile);
        
        data.dynamic.(Orientazione_tag_mobile).(Azione(1)).power = [
            data.dynamic.(Orientazione_tag_mobile).(Azione(1)).power, Inventario.(tagMobile).RSSITag ];
        data.dynamic.(Orientazione_tag_mobile).(Azione(1)).phase = [
            data.dynamic.(Orientazione_tag_mobile).(Azione(1)).phase, Inventario.(tagMobile).RSSITag ]; 
   end
   
   dest_folder = fullfile(root, target_folder, subfolder);
   mkdir(dest_folder{1});
   
   save(fullfile(dest_folder{1},'data.mat'), 'data');
   cd(root);
end

    