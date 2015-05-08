<%@ Page Title="Patient Information" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="infoPatient.aspx.cs" Inherits="WebApplication1.Admin.AdminService.infoPatient" %>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
        <h2>You can get information about patient who has an appointment</h2>
    </hgroup>

    
    

    <div>

      <table width="84%" cellpadding="0" cellspacing="0" style="border: solid 1px #3366CC;">

            <tr>

                <td colspan="4" style="height: 30px; background-color: #f5712b;">

                    <span class="TextTitle" style="color: #FFFFFF;">Get Patient Info</span>

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

                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="adminclinic" DataValueField="adminclinic">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ClinicConnectionString %>" SelectCommand="SELECT [adminclinic] FROM [LoginTable]"></asp:SqlDataSource>

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

                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Visible="False" EnableViewState="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" Width="500px">
                                    <Columns>
                                        <asp:BoundField DataField="Name" HeaderText="Name" />
                                        <asp:BoundField DataField="CareCardNo" HeaderText="CareCard No" />
                                        <asp:BoundField HeaderText="Time" DataField="time" />
                                    </Columns>
                                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                                </asp:GridView>
                               <!-- <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ClinicConnectionString %>" SelectCommand="SELECT [clinicname], [date], [time] FROM [StatusTable] WHERE ([status] = @status)">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="Available" Name="status" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource> -->
                            </td>

                        </tr>

                    </table>

                </td>

            </tr>

        </table>

    </div>


   

 </asp:Content>
