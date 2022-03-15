install-module importexcel -allowclobber -force -scope CurrentUser
get-module importexcel -listavailable | import-module -force -verbose


$disk = "$env:TEMP\disk.xlsx"
Remove-item $disk -erroraction SilentlyContinue

get-wmiobject -class win32_logicaldisk -filter "Drivetype = '3'" | export-excel $disk -autosize -startrow 2 -tablename reportprocess
get-wmiobject -class win32_logicaldisk -computername backup -filter "Drivetype = '3'" | export-excel $disk -autosize -startrow 3 -tablename reportprocess
$excel = Get-ChildItem $env:HOMEPATH\Documents\WindowsPowerShell |
Select PSDRive, PSIsC*, FullName, *time* |
Export-Excel $disk -AutoSize -StartRow 20 -TableName ReportFiles -PassThru

$ws = $excel.Workbook.Worksheets['Sheet1']


Close-ExcelPackage $excel -Show