<%@ Page Title="Delete Record" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="deleteRecord.aspx.cs" Inherits="WebApplication1.Admin.AdminService.deleteRecord" %>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    

    
    

    <div>

      <table width="84%" cellpadding="0" cellspacing="0" style="border: solid 1px #3366CC;">

            <tr>

                <td colspan="4" style="height: 30px; background-color: #f5712b;">

                    Delete Record

                </td>

            </tr>
          
                        <tr>

                            <td colspan="2" align="center">

                                <asp:Label ID="LabelMessage" ForeColor="Red" runat="server" EnableViewState="False"

                                    Visible="False"></asp:Label>
                                <br />
                                <asp:Label ID="LabelMessage2" ForeColor="Red" runat="server" EnableViewState="False"

                                    Visible="False"></asp:Label>
                                <br/>

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

                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="adminclinic" DataValueField="adminclinic">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ClinicConnectionString %>" SelectCommand="SELECT [adminclinic] FROM [LoginTable]"></asp:SqlDataSource>

                                <br />

                            </td>

                        </tr>

                        <tr>

                            <td align="right">

                                Date<span class="TextTitle">:</span>

                            </td>

                            <td align="left" style="padding-left: 10px;">

                                <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>

                               
                                <br />

                            </td>

                        </tr>
                         
                        <tr>

                            <td align="right">

                            </td>

                            <td align="left" style="padding-left: 10px;">

                                <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" Width="87px" />

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
