#FindADUserCreationDate
Add-Type -assembly system.windows.forms
$main_form = New-Object System.Windows.Forms.Form
$main_form.Text = 'GUI for my Users'
$main_form.Width = 600
$main_form.Height = 400
$main_form.AutoSize = $true

$label = new-object System.Windows.Forms.Label
$label.Text = "Users"
$label.location = New-Object system.drawing.point(0,20)
$label.autosize = $true
$main_form.Controls.Add($label)


$combobox = New-Object system.windows.forms.combobox
$combobox.width = 300
$users =  get-aduser -filter * | select -expandproperty samaccountname | sort-object -property samaccountname
foreach ($user in $users){
    $combobox.items.add($user)
    }
$combobox.location = New-Object system.drawing.point(100,20)
$main_form.controls.add($combobox)

$created = New-Object System.Windows.Forms.Label
$created.text = "User Created On:"
$created.location = New-Object system.drawing.point(0,40)
$created.autosize = $true
$main_form.controls.add($created)

$out = new-object System.Windows.Forms.Label
$out.text = ""
$out.location = new-object system.drawing.point(110,40)
$out.autosize = $true
$main_form.controls.add($out)

$button = New-Object System.Windows.Forms.Button
$button.location = new-object system.drawing.size(440,10)
$button.size = New-Object system.drawing.size (120,23)
$button.text = "check"
$main_form.controls.add($button)

$button.add_click({$out.text = ((get-aduser -identity $combobox.selecteditem -properties whencreated).whencreated)
})


$main_form.ShowDialog()