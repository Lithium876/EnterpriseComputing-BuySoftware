<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageProduct.aspx.cs" Inherits="ManageProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="App_Theme/css/bootstrap.css" rel="stylesheet" />
    <link href="App_Theme/css/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="header_top_left">
            <asp:HyperLink ID="HyperLink2" NavigateUrl="~/Default.aspx" runat="server">Home</asp:HyperLink>
        </div>

        <div class="wrap">
            <nav class="navbar navbar-expand-md navbar-dark fixed-bottom bg-dark">
                <div class="navbar-header">
                    <a href="#" class="navbar-brand">Categories</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                             <asp:LinkButton ID="lbAntiMalware" class="nav-link" OnClick="getAntiMalware" runat="server">Anti-Malware</asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <asp:LinkButton ID="lbBusinessAntivirus" class="nav-link" OnClick="getBusinessAntivirus" runat="server">Business Antivirus</asp:LinkButton>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Compression</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Developer</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Drivers</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" onserverclick="getFileTransferSoftware">File Transfer</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Multimedia</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Office / News</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Networking</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Security</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">System Tuning</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">VPNs</a>
                        </li>
                    </ul>
                </div>
            </nav>
            <div class="preview-page">
                <div class="contact-form">
                    <h3 style="width: 1150px;">Manage Products</h3>
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="SoftwareID" DataSourceID="sdsSoftware" InsertItemPosition="LastItem">
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
                                    <asp:Image ID="Image1" runat="server" Height="100" Width="80" ImageUrl='<%#"data:Image/jpg;base64," + Convert.ToBase64String((byte[])Eval("SoftwareImage")) %>' />
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
                                    <asp:Image ID="Image1" runat="server" Height="100" Width="80" ImageUrl='<%#"data:Image/jpg;base64," + Convert.ToBase64String((byte[])Eval("SoftwareImage")) %>' />
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
                                                <th runat="server">CategoryID</th>
                                                <th runat="server">Name</th>
                                                <th runat="server">Size</th>
                                                <th runat="server">Cost</th>
                                                <th runat="server">Description</th>
                                                <th runat="server">Image</th>
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
                                <td>
                                    <asp:Label ID="SoftwareImageLabel" runat="server" Text='<%# Eval("SoftwareImage") %>' />
                                </td>
                            </tr>
                        </SelectedItemTemplate>
                    </asp:ListView>
                </div>
                <asp:TextBox ID="txtCategory" runat="server" Visible="False"></asp:TextBox>
            </div>
            <asp:Label ID="lblInstruction" runat="server" Text="Update or Insert Software Images"></asp:Label><br />
            <asp:Label ID="lblSoftwareID" runat="server" Text="Software ID:"></asp:Label>
            <asp:TextBox ID="txtSoftwareID" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lblImage" runat="server" Text="Software Image:"></asp:Label>
            <asp:FileUpload ID="FileUpload1" runat="server" ToolTip="Select a Images" />
            <br />
            <asp:Label ID="lblmessage" runat="server"></asp:Label>
            <div style="margin-bottom: 60px">
                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success" class="" Text="SUBMIT" OnClick="btnSubmit_Click1" />
            </div>
        </div>

        <asp:SqlDataSource ID="sdsSoftware" runat="server" ConnectionString="<%$ ConnectionStrings:1401375ConnectionString %>" DeleteCommand="spSoftware_DeleteById" DeleteCommandType="StoredProcedure" InsertCommand="spSoftware_Insert" InsertCommandType="StoredProcedure" SelectCommand="spSoftware_SelectByCategory" SelectCommandType="StoredProcedure" UpdateCommand="spSoftware_UpdateById" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="softwareID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="categoryID" Type="Int32" />
                <asp:Parameter Name="softwareName" Type="String" />
                <asp:Parameter Name="softwareSize" Type="String" />
                <asp:Parameter Name="softwareCost" Type="String" />
                <asp:Parameter Name="softwareDescription" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txtCategory" DefaultValue="1" Name="categoryID" PropertyName="Text" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="softwareID" Type="Int32" />
                <asp:Parameter Name="categoryID" Type="Int32" />
                <asp:Parameter Name="softwareName" Type="String" />
                <asp:Parameter Name="softwareSize" Type="String" />
                <asp:Parameter Name="softwareCost" Type="String" />
                <asp:Parameter Name="softwareDescription" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
