<%--ID#: 1401375
    Developer: Lomar Lilly
    Module: Enterprise Computing--%>

<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="ProductPage.aspx.cs" Inherits="details" %>


<asp:Content ID="MyHead" runat="server" ContentPlaceHolderID="head"></asp:Content>
<asp:Content ID="MyMain" runat="server" ContentPlaceHolderID="MainContent">

    <%--Details View--%>
    <asp:DetailsView ID="dvSoftwareDetails" CssClass="table" runat="server" Height="16px" Width="955px" AutoGenerateRows="False" DataSourceID="sdsSoftware">
        <Fields>
            <asp:TemplateField>
                <ItemTemplate>
                    <ul class="back-links">
                        <li><span>
                            <asp:HyperLink ID="hlHome" NavigateUrl="~/Default.aspx" runat="server">Home</asp:HyperLink></span> ::</li>
                        <li><a href="#">Product Page</a> ::</li>
                        <li><%# Eval("SoftwareName") %> </li>
                    </ul>
                    <div class="product-details">
                        <div class="grid images_3_of_2">
                            <ul id="etalage">
                                <li>
                                    <a href="#">
                                        <asp:Image ID="softwareImage" class="etalage_source_image" runat="server" Height="300" Width="400" ImageUrl='<%#"data:Image/jpg;base64," + Convert.ToBase64String((byte[])Eval("SoftwareImage")) %>' />
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="desc span_3_of_2">
                            <h2><%# Eval("SoftwareName") %>  </h2>
                            <p><%# Eval("SoftwareDescription") %> </p>
                            <div class="price">
                                <p>Price: <span>$<%# Eval("SoftwareCost") %></span></p>
                                <asp:Label ID="SoftwareCostLabel" Visible="false" runat="server" Text='<%# Bind("SoftwareCost") %>' />
                            </div>
                            <div class="available">
                                <ul>
                                    <li><span>Size:</span> &nbsp; <%# Eval("SoftwareSize") %></li>
                                </ul>
                            </div>
                            <div class="share-desc">
                                <div class="share">
                                    <p>Number of units :</p>
                                    <asp:TextBox ID="txtAmount" class="text_box" runat="server" TextMode="Number" value="1" min="1"></asp:TextBox>
                                </div>
                                <div>
                                    <asp:Button ID="btnCheckOut" CssClass="btn btn-success" runat="server" Text="Check Out" OnClick="btn_ClickCheckOut" />
                                    <div class="button btn-warning">
                                        <span>
                                            <asp:HyperLink ID="hlContinueShopping" NavigateUrl="~/Default.aspx" runat="server">Continue Shopping</asp:HyperLink></span>
                                    </div>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <%----------------%>

    <%--Name of Software Sent From First Page--%>
    <asp:Label ID="lblSoftwareName" runat="server" Visible="false" Text="1"></asp:Label>
    <%-----------------------------------------%>

    <%-- Software Amount From session--%>
    <asp:Label ID="lblAmount" runat="server" Visible="false"></asp:Label>
    <%---------------------------------%>

    <%--SQL Data Source--%>
    <asp:SqlDataSource ID="sdsSoftware" runat="server" ConnectionString="<%$ ConnectionStrings:1401375ConnectionString %>" SelectCommand="spSoftware_SelectById" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblSoftwareName" DefaultValue="1" Name="softwareID" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <%-------------------%>
</asp:Content>
