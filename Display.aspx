<%--ID#: 1401375
    Developer: Lomar Lilly
    Module: Enterprise Computing--%>

<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="Display.aspx.cs" Inherits="Display" %>

<asp:Content ID="MyHead" runat="server" ContentPlaceHolderID="head"></asp:Content>
<asp:Content ID="MyMain" runat="server" ContentPlaceHolderID="MainContent">
    <div class="wrap">
        <div class="preview-page ">
            <h3>Payment Summery</h3>

            <%--Thanks for Shopping--%>
            <div class="grid images_3_of_2">
                <ul id="etalage">
                    <li>
                        <a href="#">
                            <img height="300" width="400" src="App_Theme/images/thanks.jpg" />
                        </a>
                    </li>
                </ul>
            </div>
            <%------------------------%>

            <%--Display customer Receipt--%>
            <table class="table">
                <tr>
                    <td>Name:</td>
                    <td>
                        <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td>Bought:</td>
                    <td>
                        <%--Form View--%>
                        <asp:FormView ID="fvSoftware" runat="server" DataSourceID="sdsSoftware">
                            <ItemTemplate>
                                <asp:Label ID="SoftwareNameLabel" runat="server" Text='<%# Bind("SoftwareName") %>' />
                            </ItemTemplate>
                        </asp:FormView>
                        <%---------------%>
                    </td>
                </tr>
                <tr>
                    <td>Amount Bought:</td>
                    <td>
                        <asp:Label ID="lblAmount" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td>Cost:</td>
                    <td>
                        <asp:Label ID="lblCost" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td>Paid With:</td>
                    <td>
                        <asp:Label ID="lblPaymentMethod" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td>Subscribed:</td>
                    <td>
                        <asp:Label ID="lblNewsletter" runat="server" Text="Label"></asp:Label></td>
                </tr>

            </table>
            <%-------------------------------------%>

            <br />

            <%--Go back to home--%>
            <div>
                <asp:Button ID="btnShopAgain" CssClass="btn btn-success" runat="server" Text="Shop Again" OnClick="btnShopAgain_Click" Width="205px" />
            </div>
            <%-------------------%>
        </div>

        <%--Software ID From Session--%>
        <asp:Label ID="lblSoftware" runat="server" Text="Label" Visible="False"></asp:Label>
        <%----------------------------%>
    </div>

    <%--SQL Data Source--%>
    <asp:SqlDataSource ID="sdsSoftware" runat="server" ConnectionString="<%$ ConnectionStrings:1401375ConnectionString %>" SelectCommand="spSoftware_SelectById" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblSoftware" DefaultValue="1" Name="softwareID" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <%-------------------%>
</asp:Content>
