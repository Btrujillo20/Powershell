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


$combobox = New-Object system.windows.forms.textbox
$combobox.width = 300
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

$button.add_click({$ping.text = (test-connection $combobox.text -quiet -count 1)


if ($ping.text -eq 'false'){
    $main_form.Close()
    }})
$main_form.ShowDialog() | Out-Null


$main_form2 = New-Object System.Windows.Forms.Form
$main_form2.Text = 'Trace Test'
$main_form2.Width = 600
$main_form2.Height = 400
$main_form2.AutoSize = $true

$label2 = new-object System.Windows.Forms.Label
$label2.Text = "Website"
$label2.location = New-Object system.drawing.point(0,20)
$label2.autosize = $true
$main_form2.Controls.Add($label2)

$label3 = new-object System.Windows.Forms.Label
$label3.Text = $combobox.Text
$label3.location = New-Object system.drawing.point(100,20)
$label3.autosize = $true
$main_form2.Controls.Add($label3)

$label4 = new-object System.Windows.Forms.Label
$label4.Text = 'Would you like to perform a traceroute?'
$label4.location = New-Object system.drawing.point(0,40)
$label4.autosize = $true
$main_form2.Controls.Add($label4)

$trace = New-Object System.Windows.Forms.Label
$trace.text = ''
$trace.location = New-Object system.drawing.point(310,40)
$trace.AutoSize = $true
$main_form2.controls.add($trace)

$yes = New-Object System.Windows.Forms.Button
$yes.location = New-Object system.drawing.size(200,400)
$yes.size = New-Object system.drawing.size(120,23)
$yes.text = 'Yes'
$main_form2.controls.add($yes)

$yes.add_click({$trace.text = (test-netconnection -traceroute -informationlevel quiet $combobox.text)})

$main_form2.showdialog() | out-null
