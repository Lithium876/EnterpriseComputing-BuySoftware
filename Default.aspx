<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="App_Theme/css/style.css" rel="stylesheet" />
    <link href="App_Theme/css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="header_top_right">
            <asp:HyperLink ID="HyperLink2" NavigateUrl="~/ManageProduct.aspx" runat="server">Manage Products</asp:HyperLink>
        </div>
        <div class="main">
            <div class="content">
                <div class="content_bottom">
                    <div class="wrap">
                        <div class="content-bottom-left">
                            <div class="categories">
                                <ul>
                                    <h3>Browse All Categories</h3>
                                    <li>
                                        <asp:LinkButton ID="lbAntiMalware" runat="server" OnClick="getAntiMalwareSoftware" Width="218px">Anti-Malware</asp:LinkButton></li>
                                    <li>
                                        <asp:LinkButton ID="lbBusinessAntivirus" runat="server" OnClick="getBusinessAntivirusSoftware" Width="220px">Business Antivirus</asp:LinkButton></li>
                                    <li>
                                        <asp:LinkButton ID="lbCompression" runat="server" OnClick="getCompressionSoftware">Compression</asp:LinkButton></li>
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
                        <div class="content-bottom-right">
                            <h3>
                                <asp:Label ID="_pageHeader" runat="server">Anti-Malware Software</asp:Label></h3>
                            <div class="section group">
                                <asp:GridView ID="GridView1" CssClass="table" runat="server" AutoGenerateColumns="False" DataSourceID="sdsSoftware" Width="737px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:Image ID="Image1" runat="server" Height="100" Width="80" ImageUrl='<%#"data:Image/jpg;base64," + Convert.ToBase64String((byte[])Eval("SoftwareImage")) %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="SoftwareName" HeaderText="Name" SortExpression="SoftwareName" />
                                        <asp:BoundField DataField="SoftwareCost" HeaderText="Cost" SortExpression="SoftwareCost" />
                                        <asp:BoundField DataField="SoftwareID" ReadOnly="True" SortExpression="SoftwareID" ItemStyle-CssClass="hide" />
                                        <asp:CommandField ShowSelectButton="True" SelectText="More Information" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="sdsSoftware" runat="server" ConnectionString="<%$ ConnectionStrings:1401375ConnectionString %>" SelectCommand="spSoftware_SelectByCategory" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtCategory" DefaultValue="1" Name="categoryID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:TextBox ID="txtCategory" runat="server" Visible="False" Style="margin-top: 0px"></asp:TextBox>
    </form>
</body>
</html>
