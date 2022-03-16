Add-Type -assembly system.windows.forms
$main_form = New-Object System.Windows.Forms.Form
$main_form.Text = 'Ping Test'
$main_form.Width = 600
$main_form.Height = 400
$main_form.AutoSize = $true

$label = new-object System.Windows.Forms.Label
$label.Text = "Website"
$label.location = New-Object system.drawing.point(0,20)
$label.autosize = $true
$main_form.Controls.Add($label)


$combobox = New-Object system.windows.forms.combobox
$combobox.width = 300
$website =  read-host -prompt 'Website'
$combobox.items.add($website)
$combobox.location = New-Object system.drawing.point(100,20)
$main_form.controls.add($combobox)

$result = New-Object System.Windows.Forms.Label
$result.text = 'Ping Result'
$result.location = New-Object system.drawing.point(0,40)
$result.autosize = $true
$main_form.controls.add($result)

$ping = New-Object System.Windows.Forms.Label
$ping.text = ''
$ping.location = New-Object system.drawing.point(110,40)
$ping.AutoSize = $true
$main_form.controls.add($ping)


$button = New-Object System.Windows.Forms.Button
$button.location = New-Object system.drawing.size(440,10)
$button.size = New-Object system.drawing.size(120,23)
$button.text = 'Send'
$main_form.controls.add($button)

$button.add_click({$ping.text = (ping $website)})
$main_form.ShowDialog()