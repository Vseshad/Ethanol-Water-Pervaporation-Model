function [gama1,gama2] = Excelui(T,xi_mole,xj_mole)
% Specify the Excel file name
excelFileName = 'UNIFAC_VLE.xlsx';

% Specify the sheet name
sheetName = 'UNIFAC (VLE)';

% Specify the row and column indices
rowIndex1 = 10;
columnIndex1 = 'C';

rowIndex2 = 21;  
columnIndex2 = 'D';

rowIndex3 = 21;  
columnIndex3 = 'F';

try
    % Try to get an existing Excel instance
    Excel = actxGetRunningServer('Excel.Application');
catch
    % If not found, create a new instance
    Excel = actxserver('Excel.Application');
end

% Make Excel visible (optional)
Excel.Visible = false;

% Open the Excel file
Workbook = Excel.Workbooks.Open(fullfile(pwd, excelFileName));

% Access the desired sheet using invoke method
Sheet = invoke(Workbook.Sheets, 'Item', sheetName);

% Update the specific cells with the existing values using Range property
Sheet.Range([columnIndex1 num2str(rowIndex1)]).Value = T;
Sheet.Range([columnIndex2 num2str(rowIndex2)]).Value = xj_mole;
Sheet.Range([columnIndex3 num2str(rowIndex3)]).Value = xi_mole;

% Save and close the Excel file with invoke method
invoke(Workbook, 'Save');
invoke(Workbook, 'Close');
invoke(Excel, 'Quit');
invoke(Excel, 'delete');

% Extract Data from Excel
% Specify the cells to extract
cellD22 = 'D22';  % Assuming D22 represents gama2
cellF22 = 'F22';  % Assuming F22 represents gama1

% Read values from specific cells
gama1 = xlsread(excelFileName, sheetName, cellF22);
gama2 = xlsread(excelFileName, sheetName, cellD22);

% Display the values in MATLAB
disp(['gama1 (Value in F22): ' num2str(gama1)]);
disp(['gama2 (Value in D22): ' num2str(gama2)]);
end