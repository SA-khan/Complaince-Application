<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/FrontendWithoutSidebar.Master" AutoEventWireup="true" CodeBehind="ReportPage.aspx.cs" Inherits="Compliance_App.ContentPages.ReportPage" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server" ScrollBars="Both" Height="600">
    <CR:CrystalReportViewer  ID="CrystalReportViewer1" runat="server" AutoDataBind="true" Visible="true" ToolPanelView="None" Width="30" EnableDatabaseLogonPrompt="False" />
        </asp:Panel>
</asp:Content>
