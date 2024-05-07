<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="marks.aspx.cs" Inherits="Grit_Management_System.marks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <div class="container">
            <h1 style="padding-bottom:3vh;">Upload CSV File</h1>
            <asp:FileUpload ID="fileUpload" runat="server" accept=".csv" />
            <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
            
            
        </div>
    </form>

</asp:Content>
