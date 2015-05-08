<%@ Page Title="Services" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="WebApplication1.About" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
        <h2>Pick your desired service.</h2>
    </hgroup>
   
    <article>
        <ul>
            <li><a id="A4" runat="server" href="~/Patient/SearchAppointment.aspx">Search Available Appointment</a></li>

            <li><a id="A1" runat="server" href="~/Patient/MakeAppointment.aspx">Make an appointment</a></li>
               
            <li><a id="A2" runat="server" href="~/Patient/RetrieveAppointment.aspx">Retrieve an appointment</a></li>
                
          


        </ul>        
            
    </article>

    
</asp:Content>