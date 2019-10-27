<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/FrontendWithoutSidebar.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Compliance_App.Default" %>
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
    <br />
    <asp:Label ID="Label1" runat="server" Text="Home" BackColor="DarkRed" ForeColor="White" CssClass="BaseName"></asp:Label>
    <br />

</asp:Content>
