<%@ Page Title="Make Appointment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MakeAppointment.aspx.cs" Inherits="WebApplication1.Patient.MakeAppointment" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
        <h2>Fill up following info for making appointment</h2>
    </hgroup>

    
    

    <div>

      <table width="84%" cellpadding="0" cellspacing="0" style="border: solid 1px #3366CC;">

            <tr>

                <td colspan="4" style="height: 30px; background-color: #f5712b;">

                    <span class="TextTitle" style="color: #FFFFFF;">Appointment Form</span>

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
                                <asp:Label ID="LabelMessage3" ForeColor="Red" runat="server" EnableViewState="False"

                                    Visible="False"></asp:Label>

                            </td>

                        </tr>

                        <tr style="font-weight: normal; color: #000000">

                            <td align="right">

                                <span>Name:</span></td>

                            <td align="left" style="padding-left: 10px;">

                                <asp:TextBox ID="TextBoxUserName" runat="server" CssClass="textbox" Width="262px"

                                    MaxLength="50" Height="34px"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxUserName" Display="Dynamic" ErrorMessage="You Must Enter Your Name!"></asp:RequiredFieldValidator>

                            </td>

                        </tr>
                        
                        <tr style="font-weight: normal; color: #000000">

                            <td align="right">

                                Clinic Name<span>:</span></td>
                           <td align="left" style="padding-left: 10px;">

                               <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="radon" DataTextField="adminclinic" DataValueField="adminclinic">
                               </asp:DropDownList>
                               <asp:SqlDataSource ID="radon" runat="server" ConnectionString="<%$ ConnectionStrings:ClinicConnectionString %>" SelectCommand="SELECT DISTINCT [adminclinic] FROM [LoginTable]">
                                   
                               </asp:SqlDataSource>

                            </td>

                        </tr>
                        
                        <tr style="font-weight: normal; color: #000000">

                            <td align="right">

                                CareCard No<span>:</span></td>

                            <td align="left" style="padding-left: 10px;">

                                <asp:TextBox ID="TextBoxCareCard" runat="server" CssClass="textbox" Width="262px"

                                    MaxLength="50" Height="34px"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxCareCard" Display="Dynamic" ErrorMessage="You Must Enter Your CareCard No!"></asp:RequiredFieldValidator>

                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBoxCareCard" ErrorMessage="Enter Digits(0-9) only" ValidationExpression="\d+"></asp:RegularExpressionValidator>

                            </td>

                        </tr>



                        <tr>

                            <td align="right">

                                Date<span class="TextTitle">:</span>

                            </td>

                            <td align="left" style="padding-left: 10px;">

                                <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                                <asp:Label ID="LabelMessage2" ForeColor="Red" runat="server" EnableViewState="False"

                                    Visible="False"></asp:Label>
                                <br />


                            </td>

                        </tr>
                         <tr>

                            <td align="right">

                                Time<span class="TextTitle">:</span>

                            </td>

                            <td align="left" style="padding-left: 10px;">

                                <asp:TextBox ID="TextBoxTime" runat="server" CssClass="textbox" Width="258px"

                                    MaxLength="50" Height="34px" TextMode="Time"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxTime" Display="Dynamic" ErrorMessage="You Must Enter Appointment Time!"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBoxTime" ErrorMessage="Enter Time in HH:MM Format" ValidationExpression="(([01][0-9])|(2[0-3])):([0-5][0-9])$"></asp:RegularExpressionValidator>

                                

                            </td>

                        </tr>


                        <tr>

                            <td align="right">

                                <span class="TextTitle">Email:</span>

                            </td>

                            <td align="left" style="padding-left: 10px;">

                                <asp:TextBox ID="TextBoxEmail" runat="server" CssClass="textbox" Width="258px"

                                    MaxLength="50" Height="34px" TextMode="Email"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxEmail" Display="Dynamic" ErrorMessage="You Must Enter Your Email ID!"></asp:RequiredFieldValidator>

                                <br />

                            </td>

                        </tr>

                        <tr>

                            <td align="right">

                            </td>

                            <td align="left" style="padding-left: 10px;">

                                <asp:Button ID="Button1" runat="server" Text="Book" OnClick="Button1_Click" Width="87px" />

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