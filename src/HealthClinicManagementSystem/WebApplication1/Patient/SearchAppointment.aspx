<%@ Page Title="Search Available Appointment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchAppointment.aspx.cs" Inherits="WebApplication1.Patient.SearchAppointment" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
        <h2>You can search here for available appointments</h2>
    </hgroup>

    
    

    <div>

      <table width="84%" cellpadding="0" cellspacing="0" style="border: solid 1px #3366CC;">

            <tr>

                <td colspan="4" style="height: 30px; background-color: #f5712b;">

                    <span class="TextTitle" style="color: #FFFFFF;">Appointment Form</span>

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

                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Visible="False" EnableViewState="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" Width="500px">
                                    <Columns>
                                        <asp:BoundField DataField="clinicname" HeaderText="Clinic Name" SortExpression="clinicname" />
                                        <asp:BoundField DataField="time" HeaderText="Time" SortExpression="time" />
                                    </Columns>
                                    <FooterStyle BackColor="#CCCCCC" />
                                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                    <RowStyle BackColor="White" />
                                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="#808080" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#383838" />
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
