<%@ Page Title="Retrieve Appointment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RetrieveAppointment.aspx.cs" Inherits="WebApplication1.Patient.RetrieveAppointment" %>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
        <h2>Fill up following info for making appointment</h2>
    </hgroup>

    
    

    <div>

      <table width="84%" cellpadding="0" cellspacing="0" style="border: solid 1px #3366CC;">

            <tr>

                <td style="height: 30px; background-color: #f5712b;">

                    <span class="TextTitle" style="color: #FFFFFF;">Appointment Form</span>

                </td>

            </tr>
                
     <tr>

                            <td colspan="2" align="center">

                                
                                <asp:Label ID="LabelMessage1" ForeColor="Red" runat="server" EnableViewState="False"

                                    Visible="False"></asp:Label>
                                <br/>

                            </td>

                        </tr>

                <td height="20px" colspan="0">

                </td>

            </tr>

            <tr>

                <td width="50%" valign="top">

                    <table id="TableLogin" class="HomePageControlBGLightGray" cellpadding="4" cellspacing="4"

                        runat="server" width="100%">


                        <tr style="font-weight: normal; color: #000000">

                            <td align="right" class="auto-style1">

                                <span>Name:</span></td>

                            <td align="left" style="padding-left: 10px;" class="auto-style1">

                                <asp:TextBox ID="TextBoxUserName2" runat="server" CssClass="textbox" Width="262px"

                                    MaxLength="50" Height="34px"></asp:TextBox>

                            </td>

                        </tr>

                        <tr>

                            <td align="right">

                                CareCard No<span class="TextTitle">:</span>

                            </td>

                            <td align="left" style="padding-left: 10px;">

                                <asp:TextBox ID="TextBoxCareCard2" runat="server" CssClass="textbox" Width="261px"

                                    MaxLength="50"  Height="34px"></asp:TextBox>

                                <br />

                            </td>

                        </tr>

                       

                        <tr>

                            <td align="right">

                            </td>

                            <td align="left" style="padding-left: 10px;">

                                <asp:Button ID="Button2" runat="server" Text="Retrieve" OnClick="Button2_Click" Width="87px" />

                                <br />

                            </td>

                        </tr>

                       
                    </table>
                    

                </td>

            </tr>
          
        </table>
        
  
      <table width="84%" cellpadding="0" cellspacing="0" style="border: solid 1px #3366CC;">
            <tr>

                            <td colspan="2" align="center">

                                
                                <asp:Label ID="LabelMessage2" ForeColor="Red" runat="server" EnableViewState="False"

                                    Visible="False"></asp:Label>
                                <br/>

                            </td>

                        </tr>
        </table>

            <tr>
                        

                         
                       
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width= 500px Visible="False" EnableViewState="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" Font-Bold="True" Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" CellPadding="4">
                                    <Columns>
                                        <asp:BoundField DataField="clinicname" HeaderText="Clinic Name" SortExpression="clinicname" />
                                        <asp:BoundField DataField="Time" HeaderText="Time" />
                                    </Columns>
                                    <EditRowStyle BorderStyle="Double" BorderWidth="1px" Width="10px" />
                                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                    <HeaderStyle BorderColor="#009933" BorderStyle="Solid" Font-Bold="True" Font-Names="Arial" Font-Size="Medium" ForeColor="#FFFFCC" HorizontalAlign="Center" VerticalAlign="Middle" BackColor="#990000" />
                                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                                    <RowStyle BackColor="White" ForeColor="#330099" />
                                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                                </asp:GridView>
    </div>


   

 </asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        .auto-style1 {
            height: 67px;
        }
    </style>
</asp:Content>
