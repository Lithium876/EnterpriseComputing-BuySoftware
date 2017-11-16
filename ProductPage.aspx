<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductPage.aspx.cs" Inherits="details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="App_Theme/css/style.css" rel="stylesheet" />
    <link href="App_Theme/css/bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:DetailsView ID="DetailsView1" CssClass="table" runat="server" Height="16px" Width="955px" AutoGenerateRows="False" DataSourceID="sdsSoftware">
            <Fields>
                <asp:TemplateField>
                    <ItemTemplate>
                        <ul class="back-links">
                            <li><span>
                                <asp:HyperLink ID="HyperLink2" NavigateUrl="~/Default.aspx" runat="server">Home</asp:HyperLink></span> ::</li>
                            <li><a href="#">Product Page</a> ::</li>
                            <li><%# Eval("SoftwareName") %> </li>
                        </ul>
                        <div class="product-details">
                            <div class="grid images_3_of_2">
                                <ul id="etalage">
                                    <li>
                                        <a href="#">
                                            <asp:Image ID="Image1" class="etalage_source_image" runat="server" Height="350" Width="600" ImageUrl='<%#"data:Image/jpg;base64," + Convert.ToBase64String((byte[])Eval("SoftwareImage")) %>' />
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="desc span_3_of_2">
                                <h2><%# Eval("SoftwareName") %>  </h2>
                                <p><%# Eval("SoftwareDescription") %> </p>
                                <div class="price">
                                    <p>Price: <span>$<%# Eval("SoftwareCost") %></span></p>
                                </div>
                                <div class="available">
                                    <ul>
                                        <li><span>Size:</span> &nbsp; <%# Eval("SoftwareSize") %></li>
                                    </ul>
                                </div>
                                <div class="share-desc">
                                    <div class="share">
                                        <p>Number of units :</p>
                                        <input type="number" class="text_box" value="1" min="1" />
                                    </div>
                                    <div>
                                        <asp:Button ID="Button2" CssClass="btn btn-success" runat="server" Text="Add to Cart" OnClick="Button1_Click" />
                                        <div class="button btn-warning">
                                            <span>
                                                <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Default.aspx" runat="server">Continue Shopping</asp:HyperLink></span>
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
        <asp:Label ID="lblSoftwareName" runat="server" Visible="False"></asp:Label>
    </form>

    <asp:SqlDataSource ID="sdsSoftware" runat="server" ConnectionString="<%$ ConnectionStrings:1401375ConnectionString %>" SelectCommand="spSoftware_SelectById" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblSoftwareName" DefaultValue="1" Name="softwareID" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</body>
</html>
