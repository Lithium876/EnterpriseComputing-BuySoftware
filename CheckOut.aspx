<%--ID#: 1401375
    Developer: Lomar Lilly
    Module: Enterprise Computing--%>

<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="CheckOut.aspx.cs" Inherits="CheckOut" %>

<asp:Content ID="MyHead" runat="server" ContentPlaceHolderID="head"></asp:Content>
<asp:Content ID="MyMain" runat="server" ContentPlaceHolderID="MainContent">
    <div class="wrap">
        <div class="preview-page">
            <h3>Purchase Summery</h3>

            <div id="left ">
                <%--Form View--%>
                <asp:FormView ID="fvSoftware" runat="server" DataSourceID="sdsSoftware">
                    <ItemTemplate>
                        <div class="grid images_3_of_2">
                            <ul id="etalage">
                                <li>
                                    <a href="#">
                                        <asp:Image ID="softwareImage" class="etalage_source_image" runat="server" Height="250" Width="300" ImageUrl='<%#"data:Image/jpg;base64," + Convert.ToBase64String((byte[])Eval("SoftwareImage")) %>' />
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <table class="table">
                            <tr>
                                <td>
                                    <asp:Label ID="lbSoftwareName" runat="server" Text="Name"></asp:Label></td>
                                <td>
                                    <asp:Label ID="SoftwareNameLabel" runat="server" Text='<%# Bind("SoftwareName") %>' /></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lnlSoftwareSize" runat="server" Text="Size"></asp:Label></td>
                                <td>
                                    <asp:Label ID="SoftwareSizetLabel" runat="server" Text='<%# Bind("SoftwareSize") %>' /></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblSoftwareCost" runat="server" Text="Cost"></asp:Label></td>
                                <td>
                                    <asp:Label ID="SoftwareCostLabel" runat="server" Text='<%# Bind("SoftwareCost") %>' /></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblSoftwareDescription" runat="server" Text="Description"></asp:Label></td>
                                <td>
                                    <asp:Label ID="SoftwareDescriptionLabel" runat="server" Text='<%# Bind("SoftwareDescription") %>' /></td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
                <%--------------%>

                <%--Display the Amount Selected on Previous page as well as Calculate the total cost for the software--%>
                <table class="table">
                    <tr>
                        <td>
                            <asp:Label ID="lblAmount" runat="server" Text="Amount"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblAmountOutput" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblTotalCost" runat="server" Text="Total Cost"></asp:Label></td>
                        <td>
                            <asp:Label ID="lblTotalCostOutput" runat="server"></asp:Label></td>
                    </tr>
                </table>
                <%-----------------------------------------------------------------------------------------------------%>
            </div>

            <div class="">
                <h3>Purchase Information</h3>

                <table>
                    <tr>
                        <td>
                            <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtFirstName" CssClass="form-control" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter First Name" ControlToValidate="txtFirstName" ForeColor="Red"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="txtLastName" CssClass="form-control" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Last Name" ControlToValidate="txtLastName" ForeColor="Red"></asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblPaymentMethod" runat="server" Text="Payment Method"></asp:Label></td>
                        <td>
                            <asp:DropDownList ID="ddlPaymentMethod" CssClass="form-control" runat="server" DataSourceID="sdsPaymentMethod" DataTextField="PaymentMethod" DataValueField="PaymentMethodID"></asp:DropDownList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Select Payment Method" ControlToValidate="ddlPaymentMethod" ForeColor="Red" InitialValue="1"></asp:RequiredFieldValidator></td>
                    </tr>

                    <tr>
                        <td>
                            <br />
                            <asp:Label ID="lblNewsletter" runat="server" Text="Sign up for Newsletter"></asp:Label></td>
                        <td>
                            <br />
                            <asp:CheckBox ID="cbNewsletter" runat="server" />
                        </td>
                        <td></td>
                    </tr>
                </table>
                <br />

                <div id="left">
                    <asp:Button ID="btnBuy" CssClass="btn btn-success" runat="server" Text="Buy" OnClick="btnBuy_Click" />
                </div>

                <%--<br />
                    <div id="right">
                        <asp:Button ID="btnCancel" CssClass="btn btn-danger" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                    </div>--%>
            </div>

        </div>
    </div>

    <%--Software Id From Session--%>
    <asp:TextBox ID="txtSoftwareId" Visible="false" runat="server" Text="1"></asp:TextBox>
    <%----------------------------%>

    <%--SQL Data Source--%>
    <asp:SqlDataSource ID="sdsSoftware" runat="server" ConnectionString="<%$ ConnectionStrings:1401375ConnectionString %>" SelectCommand="spSoftware_SelectById" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtSoftwareId" DefaultValue="1" Name="softwareID" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sdsPaymentMethod" runat="server" ConnectionString="<%$ ConnectionStrings:1401375ConnectionString %>" SelectCommand="spPaymentMethod_SelectAll" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <%-------------------%>
</asp:Content>
