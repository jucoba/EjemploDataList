<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PruebasConceptoYony._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    
    <div>
        &nbsp;<br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>&nbsp;<asp:Button ID="Button1"
            runat="server" Text="Button" />
        <asp:DataList ID="DataList1" runat="server" DataSourceID="ObjectDataSource1" BackColor="Bisque" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False">
            <ItemTemplate>
                IdDoc:
                <asp:Label ID="IdDocLabel" runat="server" Text='<%# Eval("IdDoc") %>'></asp:Label><br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="IdPago"
                    DataSourceID="ObjectDataSourceDetalle" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                    <Columns>
                        <asp:BoundField DataField="IdPago" HeaderText="IdPago" ReadOnly="True" SortExpression="IdPago" />
                        <asp:BoundField DataField="IdDoc" HeaderText="IdDoc" SortExpression="IdDoc" Visible="False" />
                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                        <asp:BoundField DataField="Valor" HeaderText="Valor" SortExpression="Valor" />
                    </Columns>
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSourceDetalle" runat="server" DeleteMethod="Delete"
                    InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData"
                    TypeName="PruebasConceptoYony.PagosTableAdapters.PagosTableAdapter" UpdateMethod="Update"
                    FilterExpression = "IdDoc = '{0}'">
                    <DeleteParameters>
                        <asp:Parameter Name="Original_IdPago" Type="String" />
                        <asp:Parameter Name="Original_IdDoc" Type="String" />
                        <asp:Parameter Name="Original_Fecha" Type="Int32" />
                        <asp:Parameter Name="Original_Valor" Type="Double" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="IdDoc" Type="String" />
                        <asp:Parameter Name="Fecha" Type="Int32" />
                        <asp:Parameter Name="Valor" Type="Double" />
                        <asp:Parameter Name="Original_IdPago" Type="String" />
                        <asp:Parameter Name="Original_IdDoc" Type="String" />
                        <asp:Parameter Name="Original_Fecha" Type="Int32" />
                        <asp:Parameter Name="Original_Valor" Type="Double" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="IdPago" Type="String" />
                        <asp:Parameter Name="IdDoc" Type="String" />
                        <asp:Parameter Name="Fecha" Type="Int32" />
                        <asp:Parameter Name="Valor" Type="Double" />
                    </InsertParameters>
                    <FilterParameters>
                        <asp:ControlParameter ControlID="IdDocLabel" PropertyName="Text" />
                    </FilterParameters>
                </asp:ObjectDataSource>
            </ItemTemplate>
            <FooterStyle BackColor="Tan" />
            <AlternatingItemStyle BackColor="PaleGoldenrod" />
            <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
        </asp:DataList><asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetData" TypeName="PruebasConceptoYony.PagosTableAdapters.Pagos1TableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="id" PropertyName="Text" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <br />
        <br />
        &nbsp;
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="IdPago"
            DataSourceID="MiCustomDS">
            <Columns>
                <asp:BoundField DataField="IdPago" HeaderText="IdPago" ReadOnly="True" SortExpression="IdPago" />
                <asp:BoundField DataField="IdDoc" HeaderText="IdDoc" SortExpression="IdDoc" />
                <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                <asp:BoundField DataField="Valor" HeaderText="Valor" SortExpression="Valor" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="MiCustomDS" runat="server" SelectMethod="getDocumentos"
            TypeName="Datos.PagosObject">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" DefaultValue="-1" Name="id" PropertyName="Text"
                    Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
