<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        /*  在此处填写叠层样式  */
        body, html {
            height: 100%;
            width: 100%;
            margin: 0;
            padding: 0;
        }

        table {
            text-align: center;
            height: 60%;
            width: 60%; /*  必须设置一个宽度， margin: 0 auto才能使之居于父组件中央*/
            margin: 10px auto; /*  通过设置外边距（margin）中的左右外边距属性为auto使之居于父组件（body）中间*/
        }

            table tr {
                height: 40px;
                width: 100%;
                border: 2px solid white;
            }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 20px;
        }

        .auto-style2 {
            width: 148px;
        }

        .auto-style7 {
            width: 148px;
            height: 25px;
        }

        .auto-style8 {
            width: 258px;
            height: 174px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:SqlDataSource ID="RosterSource" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:RosterConnectionString %>" 
            SelectCommand="SELECT * FROM [Roster]"></asp:SqlDataSource>
        <asp:GridView ID="RosterGridView" runat="server"
            HorizontalAlign="Center"
            AutoGenerateColumns="False"
            DataKeyNames="Id"
            OnSelectedIndexChanged="RosterGridView_SelectedIndexChanged"
            CellPadding="4"
            Caption="学生花名册"
            CaptionAlign="Top"
            ForeColor="#333333"
            GridLines="None"
            OnRowDeleting="RosterGridView_RowDeleting"
            OnRowEditing="RosterGridView_RowEditing"
            OnRowUpdating="RosterGridView_RowUpdating"
            OnRowCancelingEdit="RosterGridView_RowCancelingEdit">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="学号" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Name" HeaderText="姓名" SortExpression="Name" />
                <asp:BoundField DataField="Sex" HeaderText="性别" SortExpression="Sex" />
                <asp:BoundField DataField="Age" HeaderText="年龄" SortExpression="Age" />
                <asp:BoundField DataField="Birth" HeaderText="生日" SortExpression="Birth" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Tel" HeaderText="电话" SortExpression="Tel" />
                <asp:CommandField HeaderText="删除" ShowDeleteButton="True" ShowHeader="True" />
                <asp:CommandField HeaderText="修改" ShowEditButton="True" ShowHeader="True" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#2461BF" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <br />
        <table class="auto-style8">
            <tr>
                <td>学号</td>
                <td class="auto-style7">姓名</td>
                <td class="auto-style7">性别</td>
                <td class="auto-style7">年龄</td>
                <td class="auto-style7">生日</td>
                <td class="auto-style7">电话</td>
            </tr>
            <tr>
                <td>

                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

                <td class="auto-style2">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" colspan="6">
                    <asp:Button ID="AddButton" runat="server" OnClick="AddButton_Click" Text="添加" Height="27px" Width="97px" />
                </td>
            </tr>
        </table>
        <br />
    </form>
</body>
</html>
