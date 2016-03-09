function saveRes( hObject,eventdata, type )
    handles = guidata(hObject);
    imageType_s = get(handles.chooseImageType, 'String');
    imageType = imageType_s{get(handles.chooseImageType, 'Value')};
    maskFile = get(handles.txtMaskFile, 'String');
    switch type
        case 'lm'
            est_s = get(handles.chooseEst_lm, 'String');
            est = est_s{get(handles.chooseEst_lm, 'Value')};
            var_s = get(handles.chooseVarName_lm, 'String');
            var = var_s{get(handles.chooseVarName_lm, 'String')};
            data = eval([handles.c_data.est.var]);
        case 'glm'
            est_s = get(handles.chooseEst_glm, 'String');
            est = est_s{get(handles.chooseEst_glm, 'Value')};
            var_s = get(handles.chooseVarName_glm, 'String');
            var = var_s{get(handles.chooseVarName_glm, 'String')};
            data = eval([handles.c_data.est.var]);
        case 'roc'
            est_s = get(handles.chooseEst_roc, 'String');
            est = est_s{get(handles.chooseEst_roc, 'Value')};
            data = eval([handles.c_data.est]);
    end
    switch imageType
        case 'minc'
            [fileName, dirName] = uiputfile({'*.mnc'}, 'Save As');
            fullFilePath = [dirName fileName];
            set(handles.lblStatus, 'String', 'VoxelStats v1.1 - Busy...');
            VoxelStatsWriteMinc(data, fullFilePath, maskFile);
        case 'nifty'
            [fileName, dirName] = uiputfile({'*.nii'}, 'Save As');
            fullFilePath = [dirName fileName];
            set(handles.lblStatus, 'String', 'VoxelStats v1.1 - Busy...');
            VoxelStatsWriteNifti(data, fullFilePath, maskFile);
    end
    set(handles.lblStatus, 'String', 'VoxelStats v1.1 - Idle.');

end

