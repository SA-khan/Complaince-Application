<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/FrontendWithoutSidebar.Master" AutoEventWireup="true" CodeBehind="UploadUNSecurityCouncilConsolidated.aspx.cs" Inherits="Compliance_App.ContentPages.UploadUNSecurityCouncilConsolidated" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 100%;
  height:370px;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

.container {
  padding: 2px 16px;
}

table {
    margin-top:15px;
}

tr {
    width:400px;
    margin:10px;
    height:50px;
    border-bottom:1px solid gray;
}

td {
    min-height:50px;
    width:200px;
    text-align:left;
    margin:5px;
    padding-left:5px;
}

thead {
    background-color:darkred;
    color:white;
}

heading {
    width:400px;
    text-align:center;
    height:50px;
}
.BaseName {
    opacity:0.8;
    padding:5px;
    margin-left:10px;
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
        <asp:Label ID="Label1" runat="server" Text="Upload UN Security Council Consolidated Data" BackColor="DarkRed" ForeColor="White" CssClass="BaseName"></asp:Label>
        <br />
        <br />
        <br />
        <br />
        <div class="jumbotron" style="min-height:485px">

        <!--<div class="card">-->
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>  
        
            <table style="margin:auto;border:1px solid black;background-color:aquamarine">
                <thead>
                    <tr>
                        <th colspan="3" style="text-align:center;background-color:white;">
                            <%--<asp:Image ID="Image1" runat="server" ImageUrl="~/images/paypak.png" />--%>
                        </th>
                    </tr>
                    <tr>
                      <th id="heading" colspan="3" style="text-align:center;">
                        <span style="font-size:large;font-family:Arial;text-align:center;margin:auto;">UN Security Council Consolidated DATA UPLOAD PANEL</span>
                      </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <span style="font-size:17px;font-family:Arial;color:black;float:right;margin-right:20px;">File:</span>
                        </td>
                        <td colspan="2">
                            <asp:FileUpload ID="FileUploadPayPak" runat="server" ViewStateMode="Enabled" />
                        </td>
                    </tr>
                    <%--<tr>
                        <td>
                            <span style="font-size:17px;font-family:Arial;color:black;float:right;margin-right:20px;">Month:</span>
                        </td>
                        <td colspan="2">
                            <asp:DropDownList ID="DropDownMonth" Height="25px" runat="server">
                                <asp:ListItem Value="0">Select Month..</asp:ListItem>
                                <asp:ListItem Value="1">January</asp:ListItem>
                                <asp:ListItem Value="2">Febuary</asp:ListItem>
                                <asp:ListItem Value="3">March</asp:ListItem>
                                <asp:ListItem Value="4">April</asp:ListItem>
                                <asp:ListItem Value="5">May</asp:ListItem>
                                <asp:ListItem Value="6">June</asp:ListItem>
                                <asp:ListItem Value="7">July</asp:ListItem>
                                <asp:ListItem Value="8">August</asp:ListItem>
                                <asp:ListItem Value="9">September</asp:ListItem>
                                <asp:ListItem Value="10">October</asp:ListItem>
                                <asp:ListItem Value="11">November</asp:ListItem>
                                <asp:ListItem Value="12">December</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>--%>
                    <tr>
                        <td></td>
                        <td colspan="2">
                            <asp:Button ID="btnUpload" runat="server" Text="UPLOAD" OnClick="btnUpload_Click" />
                        </td>
                    </tr>
                    <tr id="trStatus" runat="server">
                        <td colspan="3" style="text-align:center">
                            <span style="font-size:17px;font-family:Arial;color:darkred;"><asp:Label ID="lblStatus" runat="server" Text=""></asp:Label></span>
                        </td>
                    </tr>
                </tbody>
                <%--<tfoot style="background-color:white;">
                    <tr>
                        <th colspan="3" style="text-align:right;background-color:white;margin-right:5px;">
                            <div style="margin-right:5px;">
                               <span>Application Developed By </span><asp:Image ID="Image2" runat="server" Width="120" ImageUrl="~/images/innovarge.png" />
                            </div>
                        </th>
                    </tr>
                </tfoot>--%>
            </table>

             </ContentTemplate>


             <Triggers>

                 <asp:PostBackTrigger ControlID="btnUpload" />

             </Triggers>

        </asp:UpdatePanel>
                            
        <!--</div>-->

    </div>
</asp:Content>
