<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication1.Contact" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
        <h2>Don&#39;t hesitate to contact me if you have any query!!</h2>
    </hgroup>

    <section class="contact">
        <header>
            <h3>Phone:</h3>
        </header>
        <p>
            <span class="label">Main:</span>
            604-961-3648</p>
    </section>

    <section class="contact">
        <header>
            <h3>Email:</h3>
        </header>
        <p>
            <span class="label">Support:</span>
            aradon@sfu.ca</p>
        <header>
            <h3>Address:</h3>
        </header>
        <p>
            LRH 414, 8888 University Drive, SFU</p>
        <p>
            Burnaby, BC, V5A 1S6, Canada</p>
    </section>
</asp:Content>