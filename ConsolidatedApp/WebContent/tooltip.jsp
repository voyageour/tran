<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>jQuery Clean and Minimal Tooltip Plugin: Gips</title>
    <link href="tooltip/css/gips.css" rel="stylesheet" type="text/css" />
    <script src="tooltip/js/jquery.min.js" type="text/javascript"></script>
    <script src="tooltip/js/gips.js" type="text/javascript"></script>
    <style type="text/css">
        body
        {
            background-color: #E3E5E4;
            background: url(images/bg.jpg);
        }
        #center
        {
            margin: auto;
            width: 440px;
            height: 300px;
            padding: 40px;
            padding-top: 10px;
        }
        #header
        {
            background-image: url(images/header.png);
            background-repeat: no-repeat;
            width: 100%;
            height: 70px;
        }
        #demo input
        {
            width: 330px;
            height: 10px;
            margin-top: 80px;
            border: solid 1px #c9c9c9;
            padding: 10px;
            padding-top: 6px;
            font-family: Arial;
            font-size: 11px;
            font-weight: bold;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $('input#purple').gips({ 'theme': 'purple', autoHide: true, text: 'This is purple tooltip, auto hide after pausess time elapses.' });
            $('input#green').gips({ 'theme': 'green', placement: 'left' });
            $('input#yellow').gips({ 'theme': 'yellow', autoHide: true, placement: 'right' });
            $('input#red').gips({ 'theme': 'red', placement: 'bottom' });
        });
    </script>
</head>
<body>
    <div id="center">
        <div id="header">
        </div>
        <div id="demo">
            <input type="text" value="Purple Tooltip Here." id="purple" />
            <input type="text" value="Green Tooltip Here." id="green" />
            <input type="text" value="Yellow Tooltip Here." id="yellow" />
            <input type="text" value="Red Tooltip Here." id="red" />
        </div>
    </div>
 </body>
</html>
