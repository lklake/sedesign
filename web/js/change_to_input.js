/*
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>单击单元格，将其变为文本框</title>
<style type="text/css">
    <!--
        body{font-size:12px;}
td {
    border-width: 1px;
    border-top-style: solid;
    border-right-style: none;
    border-bottom-style: none;
    border-left-style: solid;
    text-align: center;
    width: 25%;
    height: 20px;
}
table {
    border-width:1px;
    border-right-style: solid;
    border-bottom-style: solid;
    border-top-style: none;
    border-left-style: none;
    border-color:#000;
}
.text { width: 95%;border: 1px dashed #FF9900; }
-->
</style>
<script language="javascript">
    // 将单元格转化成文本框
    function changeTotext(obj)
    {
        var tdValue = obj.innerText;
        obj.innerText = "";
        var txt = document.createElement("input");
        txt.type = "text";
        txt.value = tdValue;
        txt.id = "_text_000000000_";
        txt.setAttribute("className","text");
        obj.appendChild(txt);
        txt.select();
        //obj.style.border = "1px dashed #ff9900";
    }
// 取消单元格中的文本框，并将文本框中的值赋给单元格
function cancel(obj)
{
    var txtValue = document.getElementById("_text_000000000_").value;
    obj.innerText = txtValue;
}
/!*********************************************!/
// 事件
document.ondblclick = function()
{
    if (event.srcElement.tagName.toLowerCase() == "td")
    {
        changeTotext(event.srcElement);
    }

}
document.onmouseup = function()
    {
        if (document.getElementById("_text_000000000_") && event.srcElement.id != "_text_000000000_")
        {
            var obj = document.getElementById("_text_000000000_").parentElement;
            cancel(obj);
        }
    }
    </script>
    </head>
    <body>
    <table width="50%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
    <td>dblclick</td>
    <td> </td>
    <td> </td>
    <td> </td>
    </tr>
    <tr>
    <td> </td>
    <td> </td>
    <td> </td>
    <td> </td>
    </tr>
    <tr>
    <td> </td>
    <td> </td>
    <td> </td>
    <td> </td>
    </tr>
    <tr>
    <td> </td>
    <td> </td>
    <td> </td>
    <td> </td>
    </tr>
    <tr>
    <td> </td>
    <td> </td>
    <td> </td>
    <td> </td>
    </tr>
    </table>
    </body>
    </html>

*/
