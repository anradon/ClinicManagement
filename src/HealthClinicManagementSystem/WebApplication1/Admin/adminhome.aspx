<%@ Page Title="Admin Home" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="adminhome.aspx.cs" Inherits="WebApplication1.Admin.adminhome" %>
<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <p>
                Welcome to health clinic patient management system</p>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    
    <p>
    This is the home page of Admin!</p>
    
    </asp:Content>