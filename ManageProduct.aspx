<%--ID#: 1401375
    Developer: Lomar Lilly
    Module: Enterprise Computing--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageProduct.aspx.cs" Inherits="ManageProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Products | Buy Products</title>
    <link href="App_Theme/css/bootstrap.css" rel="stylesheet" />
    <link href="App_Theme/css/style.css" rel="stylesheet" />
    <script src="App_Theme/js/jquery-1.9.0.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">

        <%--Header--%>
        <div class="header">
            <div class="wrap">
                <div class="header_top">
                    <div class="logo">
                        <a href="#">
                            <img src="App_Theme/images/logo.png" /></a>
                    </div>
                    <div class="header_top_right">
                        <asp:HyperLink ID="hlManageProduct" NavigateUrl="~/Default.aspx" runat="server">Home</asp:HyperLink>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <%----------%>

        <div class="wrap">

            <%--Bottom Nav-bar for Category listings--%>
            <nav class="navbar navbar-expand-md navbar-dark fixed-bottom bg-dark">
                <div class="navbar-header">
                    <a href="#" class="navbar-brand">Categories</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <asp:LinkButton ID="lbAntiMalware" class="nav-link" OnClick="getAntiMalwareSoftware" runat="server">Anti-Malware</asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton ID="lbBusinessAntivirus" class="nav-link" OnClick="getBusinessAntivirusSoftware" runat="server">Business Antivirus</asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton ID="lbBackup" class="nav-link" OnClick="getBackupSoftware" runat="server">Backup</asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton ID="lbDeveloper" class="nav-link" OnClick="getDeveloperSoftware" runat="server">Developer</asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton ID="lbDrivers" class="nav-link" OnClick="getDriverSoftware" runat="server">Drivers</asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton ID="lbFileTransfer" class="nav-link" OnClick="getDeveloperSoftware" runat="server">File Transfer</asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton ID="lbMultimedia" class="nav-link" OnClick="getMultimediaSoftware" runat="server">Multimedia</asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton ID="lbOfficeNews" class="nav-link" OnClick="getOfficeNewsSoftware" runat="server">Office / News</asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton ID="lbNetworking" class="nav-link" OnClick="getNetworkingSoftware" runat="server">Networking</asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton ID="lbSecurity" class="nav-link" OnClick="getSecuritySoftware" runat="server">Security</asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton ID="lbSystemTuning" class="nav-link" OnClick="getSystemTuningSoftware" runat="server">System Tuning</asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton ID="lbVPNs" class="nav-link" OnClick="getVPNsSoftware" runat="server">VPNs</asp:LinkButton>
                        </li>
                    </ul>
                </div>

            </nav>
            <%--------------------------%>

            <%--Content Wrapper--%>
            <div class="preview-page">

                <%--List view of Software Categories--%>
                <div class="contact-form">
                    <h3 style="width: 1150px;">Browse Software</h3>
                    <asp:ListView ID="lvManageProducts" runat="server" DataSourceID="odsSoftware" InsertItemPosition="LastItem" DataKeyNames="SoftwareID">
                        <AlternatingItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </td>
                                <td>
                                    <asp:Label ID="SoftwareIDLabel" runat="server" Text='<%# Eval("SoftwareID") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Eval("CategoryID") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="SoftwareNameLabel" runat="server" Text='<%# Eval("SoftwareName") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="SoftwareSizeLabel" runat="server" Text='<%# Eval("SoftwareSize") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="SoftwareCostLabel" runat="server" Text='<%# Eval("SoftwareCost") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="SoftwareDescriptionLabel" runat="server" Text='<%# Eval("SoftwareDescription") %>' />
                                </td>
                                <td>
                                    <asp:Image ID="SoftwareImage" runat="server" Height="100" Width="300" ImageUrl='<%#"data:Image/jpg;base64," + Convert.ToBase64String((byte[])Eval("SoftwareImage")) %>' />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>
                                    <asp:Label ID="SoftwareIDLabel1" runat="server" Text='<%# Eval("SoftwareID") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="CategoryIDTextBox" runat="server" Text='<%# Bind("CategoryID") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="SoftwareNameTextBox" runat="server" Text='<%# Bind("SoftwareName") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="SoftwareSizeTextBox" runat="server" Text='<%# Bind("SoftwareSize") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="SoftwareCostTextBox" runat="server" Text='<%# Bind("SoftwareCost") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="SoftwareDescriptionTextBox" runat="server" Text='<%# Bind("SoftwareDescription") %>' />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                </td>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:TextBox ID="CategoryIDTextBox" runat="server" Text='<%# Bind("CategoryID") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="SoftwareNameTextBox" runat="server" Text='<%# Bind("SoftwareName") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="SoftwareSizeTextBox" runat="server" Text='<%# Bind("SoftwareSize") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="SoftwareCostTextBox" runat="server" Text='<%# Bind("SoftwareCost") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="SoftwareDescriptionTextBox" runat="server" Text='<%# Bind("SoftwareDescription") %>' />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </td>
                                <td>
                                    <asp:Label ID="SoftwareIDLabel" runat="server" Text='<%# Eval("SoftwareID") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Eval("CategoryID") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="SoftwareNameLabel" runat="server" Text='<%# Eval("SoftwareName") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="SoftwareSizeLabel" runat="server" Text='<%# Eval("SoftwareSize") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="SoftwareCostLabel" runat="server" Text='<%# Eval("SoftwareCost") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="SoftwareDescriptionLabel" runat="server" Text='<%# Eval("SoftwareDescription") %>' />
                                </td>
                                <td>
                                    <asp:Image ID="SoftwareImage" runat="server" Height="100" Width="300" ImageUrl='<%#"data:Image/jpg;base64," + Convert.ToBase64String((byte[])Eval("SoftwareImage")) %>' />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                                            <tr runat="server" style="">
                                                <th runat="server"></th>
                                                <th runat="server">ID</th>
                                                <th runat="server">Cat-ID</th>
                                                <th runat="server">Name</th>
                                                <th runat="server">Size</th>
                                                <th runat="server">Cost</th>
                                                <th runat="server">Description</th>
                                            </tr>
                                            <tr id="itemPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style=""></td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                                </td>
                                <td>
                                    <asp:Label ID="SoftwareIDLabel" runat="server" Text='<%# Eval("SoftwareID") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Eval("CategoryID") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="SoftwareNameLabel" runat="server" Text='<%# Eval("SoftwareName") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="SoftwareSizeLabel" runat="server" Text='<%# Eval("SoftwareSize") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="SoftwareCostLabel" runat="server" Text='<%# Eval("SoftwareCost") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="SoftwareDescriptionLabel" runat="server" Text='<%# Eval("SoftwareDescription") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                </div>
                <%------------------------------------%>

                <%--Control for Category ID--%>
                <asp:TextBox ID="txtCategory" runat="server" Visible="False"></asp:TextBox>
                <%--------------------------%>

                <%--Image Update--%>
                <asp:Label ID="lblInstruction" runat="server" Text="Update Software Images"></asp:Label><br />
                <asp:Label ID="lblSoftwareID" runat="server" Text="Software ID:"></asp:Label>
                <asp:TextBox ID="txtSoftwareID" runat="server"></asp:TextBox>
                <br />
                <asp:Label ID="lblImage" runat="server" Text="Software Image:"></asp:Label>
                <asp:FileUpload ID="fuImagePath" runat="server" ToolTip="Select a Images" />
                <br />
                <asp:Label ID="lblmessage" runat="server"></asp:Label>
                <div style="margin-bottom: 60px">
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success" class="" Text="SUBMIT" OnClick="btnSubmit_Click" />
                </div>
                <%---------------%>
            </div>
            <%--------------------%>

            <%--Object Data Source--%>
            <asp:ObjectDataSource ID="odsSoftware" runat="server" InsertMethod="Software_Insert" OldValuesParameterFormatString="{0}" SelectMethod="Software_SelectByCategory_IEnumerable" TypeName="BusinessClass" DeleteMethod="Software_DeleteById" UpdateMethod="Software_UpdateById">
                <DeleteParameters>
                    <asp:Parameter Name="SoftwareID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CategoryID" Type="Int32" />
                    <asp:Parameter Name="SoftwareName" Type="String" />
                    <asp:Parameter Name="SoftwareSize" Type="String" />
                    <asp:Parameter Name="SoftwareCost" Type="String" />
                    <asp:Parameter Name="SoftwareDescription" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtCategory" DefaultValue="1" Name="CategoryId" PropertyName="Text" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="SoftwareID" Type="Int32" />
                    <asp:Parameter Name="CategoryID" Type="Int32" />
                    <asp:Parameter Name="SoftwareName" Type="String" />
                    <asp:Parameter Name="SoftwareSize" Type="String" />
                    <asp:Parameter Name="SoftwareCost" Type="String" />
                    <asp:Parameter Name="SoftwareDescription" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
            <%--------------------------------%>
        </div>
    </form>
</body>
</html>
