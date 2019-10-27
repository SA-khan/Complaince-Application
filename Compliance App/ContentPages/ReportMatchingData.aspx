<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/FrontendWithoutSidebar.Master" AutoEventWireup="true" CodeBehind="ReportMatchingData.aspx.cs" Inherits="Compliance_App.ContentPages.ReportMatchingData" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
.BaseName {
    opacity:0.8;
    padding:5px;
    margin-left:10px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
    <br />
        <asp:Label ID="Label1" runat="server" Text="Report Matching Data" BackColor="DarkRed" ForeColor="White" CssClass="BaseName"></asp:Label>
    <br />
    <br />
    <table style="margin-left:10px;">
        <tr>
            <td><asp:Button ID="Button1" runat="server" Text="CLEAR DATA" OnClick="Button1_Click" /></td>
            <td><asp:Button ID="Button2" runat="server" Text="REMATCH DATA" OnClick="Button2_Click" /></td>
            <td><asp:Button ID="Button3" runat="server" Text="CRYSTAL REPORT VIEW" OnClick="Button3_Click" /></td>
        </tr>
        <tr
            <td>
                
            </td>
        </tr>
    </table>
    
    <br />
    <%--<asp:View ID="View1" runat="server">--%>
    <asp:Panel ID="Panel1" runat="server" ScrollBars="Both" Height="500">
    <asp:GridView ID="GridView1" style="margin-left:10px;" runat="server" HeaderStyle-BackColor="Black" HeaderStyle-ForeColor="White" AlternatingRowStyle-BackColor="LightGray" Font-Size="14px"></asp:GridView>
        </asp:Panel>
<%--        </asp:View>--%>
        </ContentTemplate> <Triggers><asp:PostBackTrigger ControlID="Button2" /></Triggers></asp:UpdatePanel>
</asp:Content>
