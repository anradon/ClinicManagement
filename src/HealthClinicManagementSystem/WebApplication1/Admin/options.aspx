<%@ Page Title="Options" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="options.aspx.cs" Inherits="WebApplication1.Admin.options" %>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
        <h2>You have following priveleges.</h2>
    </hgroup>
   
    <article>
        <ul>
            <li><a id="A1" runat="server" href="~/Admin/AdminService/insertNewAppointment.aspx">Insert new appointment</a></li>
               
            <li><a id="A2" runat="server" href="~/Admin/AdminService/infoPatient.aspx">Get Patient Information</a></li>
                
             <li><a id="A4" runat="server" href="~/Admin/AdminService/deleteRecord.aspx">Delete Today's Record</a></li>
                
          <!-- <li><a id="A3" runat="server" href="~/Contact.aspx">Cancel appointment</a></li>

            -->

        </ul>        
            
    </article>

    
</asp:Content>
