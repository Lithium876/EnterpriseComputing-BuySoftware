<%--ID#: 1401375
    Developer: Lomar Lilly
    Module: Enterprise Computing--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home | Buy Software</title>
    <link href="App_Theme/css/style.css" rel="stylesheet" />
    <link href="App_Theme/css/bootstrap.css" rel="stylesheet" />
    <script src="App_Theme/js/jquery-1.9.0.min.js"></script>
</head>
<body>
    <form id="fmain" runat="server">
        <div class="header">
            <div class="wrap">
                <div class="header_top">
                    <div class="logo">
                        <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Default.aspx" runat="server">
                            <img src="App_Theme/images/logo.png" /></asp:HyperLink>
                    </div>
                    <div class="header_top_right">
                        <asp:HyperLink ID="hlManageProduct" NavigateUrl="~/ManageProduct.aspx" runat="server">Manage Products</asp:HyperLink>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="navigation">
                    <a class="toggleMenu" href="#">Menu</a>
                    <ul class="nav">
                        <li>
                            <asp:HyperLink ID="hlHome" NavigateUrl="~/Default.aspx" runat="server">Home</asp:HyperLink>
                        </li>
                        <li class="test">
                            <a href="#">About Us</a>
                        </li>
                        <li>
                            <a href="#">Contact Us</a>
                        </li>
                    </ul>
                    <span class="left-ribbon"></span>
                    <span class="right-ribbon"></span>
                </div>
                <div class="header_bottom">
                    <div class="slider-text">
                        <h2>THE LATEST VERSIONS
                                            <br />
                            OF THE BEST SOFTWARE</h2>
                        <p>
                            &#10004; Hand picked software titles - only the best!<br />
                            &#10004; Tested for malware, adware and viruses
                            <br />
                            &#10004; No added bundles, installers or toolbars
                        </p>
                    </div>
                    <div class="slider-img">
                        <img src="App_Theme/images/slider-img.png" />
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <div class="content">
            <div class="content_bottom">
                <div class="wrap">

                    <%--4 Left Side Category List--%>
                    <div class="content-bottom-left">
                        <div class="categories">
                            <ul>
                                <h3>Browse All Categories</h3>
                                <li>
                                    <asp:LinkButton ID="lbAntiMalware" runat="server" OnClick="getAntiMalwareSoftware" Width="218px">Anti-Malware</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton ID="lbBusinessAntivirus" runat="server" OnClick="getBusinessAntivirusSoftware" Width="220px">Business Antivirus</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton ID="lbCompression" runat="server" OnClick="getCompressionSoftware">Backup</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton ID="lbDeveloper" runat="server" OnClick="getDeveloperSoftware">Developer</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton ID="lbDriver" runat="server" OnClick="getDriverSoftware">Drivers</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton ID="lbFileTransfer" runat="server" OnClick="getFileTransferSoftware">File Transfer</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton ID="lbMultimedia" runat="server" OnClick="getMultimediaSoftware">Multimedia</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton ID="lbOfficeNew" runat="server" OnClick="getOfficeNewsSoftware">Office / News</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton ID="lbNetworking" runat="server" OnClick="getNetworkingSoftware">Networking</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton ID="lbSecurity" runat="server" OnClick="getSecuritySoftware">Security</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton ID="lbSystemTuning" runat="server" OnClick="getSystemTuningSoftware">System Tuning</asp:LinkButton></li>
                                <li>
                                    <asp:LinkButton ID="lbVPNsPrivacy" runat="server" OnClick="getVPNsPrivacySoftware">VPNs / Privacy</asp:LinkButton></li>
                            </ul>
                        </div>
                    </div>
                    <%--4---------------------------%>

                    <%--3 Software List Wrapper--%>
                    <div class="content-bottom-right">
                        <h3>
                            <asp:Label ID="_pageHeader" runat="server">Anti-Malware Software</asp:Label></h3>

                        <%--2 Grid View Wrapper--%>
                        <div class="section group">

                            <%--1 Grid View--%>
                            <asp:GridView ID="gvSoftware" CssClass="table" runat="server" AutoGenerateColumns="False" DataSourceID="sdsSoftware" Width="737px" OnSelectedIndexChanged="gvSoftware_SelectedIndexChanged">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Image ID="SoftwareImage" runat="server" Height="100" Width="80" ImageUrl='<%#"data:Image/jpg;base64," + Convert.ToBase64String((byte[])Eval("SoftwareImage")) %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="SoftwareName" HeaderText="Name" SortExpression="SoftwareName" />
                                    <asp:BoundField DataField="SoftwareCost" HeaderText="Cost" SortExpression="SoftwareCost" />
                                    <asp:BoundField DataField="SoftwareID" ReadOnly="True" SortExpression="SoftwareID" ItemStyle-CssClass="hide" />
                                    <asp:CommandField ShowSelectButton="True" SelectText="More Information" />
                                </Columns>
                            </asp:GridView>
                            <%--1-------------%>
                        </div>
                        <%--2--------------------%>
                    </div>
                    <%--3--------------------------%>
                </div>
            </div>
        </div>


        <%--Control for Category ID--%>
        <asp:TextBox ID="txtCategory" runat="server" Visible="False" Style="margin-top: 0px"></asp:TextBox>
        <%---------------------------%>

        <%--SQL Data Source--%>
        <asp:SqlDataSource ID="sdsSoftware" runat="server" ConnectionString="<%$ ConnectionStrings:1401375ConnectionString %>" SelectCommand="spSoftware_SelectByCategory" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtCategory" DefaultValue="1" Name="categoryID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <%------------------%>
    </form>
</body>
</html>
