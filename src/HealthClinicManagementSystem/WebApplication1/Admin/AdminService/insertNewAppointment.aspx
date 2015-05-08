<%@ Page Title="Insert New Appointment" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="insertNewAppointment.aspx.cs" Inherits="WebApplication1.Admin.AdminService.insertNewAppointment" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
        <h2>Fill up following info for inserting new appointment</h2>
    </hgroup>

    
    <div>

      <table width="84%" cellpadding="0" cellspacing="0" style="border: solid 1px #3366CC;">

            <tr>

                <td colspan="4" style="height: 30px; background-color: #f5712b;">

                    <span class="TextTitle" style="color: #FFFFFF;">New Appointment Insertion Form</span>

                </td>

            </tr>

            <tr>

                <td height="20px" colspan="0">

                </td>

            </tr>

            <tr>

                <td width="50%" valign="top">

                    <table id="TableLogin" class="HomePageControlBGLightGray" cellpadding="4" cellspacing="4"

                        runat="server" width="100%">

                        <tr>

                            <td colspan="2" align="center">

                                <asp:Label ID="LabelMessage" ForeColor="Red" runat="server" EnableViewState="False"

                                    Visible="False"></asp:Label><br/>

                            </td>

                        </tr>

                        <tr style="font-weight: normal; color: #000000">

                            <td align="right">

                                User N<span>ame:</span></td>

                            <td align="left" style="padding-left: 10px;">

                                <asp:TextBox ID="TextBoxUserName" runat="server" CssClass="textbox" Width="262px"

                                    MaxLength="50" Height="34px"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxUserName" ErrorMessage="Must Enter Your User Name!"></asp:RequiredFieldValidator>

                            </td>

                        </tr>

                        <tr>

                            <td align="right">

                                Clinic Name<span class="TextTitle">:</span>

                            </td>

                            <td align="left" style="padding-left: 10px;">

                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="adminclinic" DataValueField="adminclinic">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ClinicConnectionString %>" SelectCommand="SELECT [adminclinic] FROM [LoginTable]"></asp:SqlDataSource>

                                <br />

                            </td>

                        </tr>

                        <tr>

                            <td align="right">

                                Date<span class="TextTitle">:</span>

                            </td>

                            <td align="left" style="padding-left: 10px;">

                                <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>

                            </td>

                        </tr>

                        <tr>

                            <td align="right" class="auto-style1">

                                Time<span class="TextTitle">:</span>

                            </td>

                            <td align="left" style="padding-left: 10px;" class="auto-style1">

                                <asp:TextBox ID="TextBoxTime" runat="server" CssClass="textbox" Width="258px"

                                    MaxLength="50" Height="34px"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxTime" Display="Dynamic" ErrorMessage="Must Enter Time!"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxTime" ErrorMessage="Enter Time in HH:MM Format!" ValidationExpression="(([01][0-9])|(2[0-3])):([0-5][0-9])$"></asp:RegularExpressionValidator>

                                <br />

                            </td>

                        </tr>

                        
                       


                        <tr>

                            <td align="right">

                            </td>

                            <td align="left" style="padding-left: 10px;">

                                <asp:Button ID="Button1" runat="server" Text="Insert" OnClick="Button1_Click" Width="87px" />

                                <br />

                            </td>

                        </tr>

                        <tr>

                            <td align="right">

                                &nbsp;</td>

                            <td align="left" style="padding-left: 10px;">

                                &nbsp;</td>

                        </tr>

                    </table>

                </td>

            </tr>

        </table>

    </div>


   

 </asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        .auto-style1 {
            height: 87px;
        }
    </style>
</asp:Content>
