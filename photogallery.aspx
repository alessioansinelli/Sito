<%@ Page Title="" Language="C#" MasterPageFile="~/mercenari.master" AutoEventWireup="true" CodeFile="photogallery.aspx.cs" Inherits="_photogallery" %>
<%@ Register src="uc/menu.ascx" tagname="menu" tagprefix="uc1" %>
<%@ Register src="uc/contenuto.ascx" tagname="contenuto" tagprefix="uc2" %>

<%@ Register src="uc/Photogallery.ascx" tagname="Photogallery" tagprefix="uc3" %>

<%-- Aggiungere qui i controlli del contenuto --%>
<asp:Content ID="menu" runat="server" ContentPlaceHolderID="menu">
	<uc1:menu ID="menu1" runat="server" SelectedMenu="foto" />
</asp:Content>

<asp:Content ID="head" runat="server" ContentPlaceHolderID="addheadcontent">
    <title>Associazione Aranceri Mercenari - Le Foto - <asp:Literal runat="server" id="TitleTag"></asp:Literal></title>
    <link rel="stylesheet" type="text/css" href="/css/foto.css" />
</asp:Content>

<asp:Content ID="content" runat="server" ContentPlaceHolderID="content">
    <form id="form1" runat="server">
    <div class="foto">
        <div class="titolo grid_12"><img src="images/stemmi/stella_30.png" alt="Stella Mercenari" /></div>        
        <div class="j grid_8 left">
        
            <uc3:Photogallery ID="Photogallery1" runat="server" TipoOggetto="Photogallery" AllowPagination="true" />
        
        </div>
        <div class="grid_4 right">
            <asp:Repeater ID="repgallery" runat="server">
					<HeaderTemplate><h1>Tutte le gallerie</h1>
					    <ul class="fotogallery">
					</HeaderTemplate>
					<ItemTemplate>
					    <li class="<%# Utility.getClassname(Container.ItemIndex, 2, "cb") %>">
						    <h2><%# DataBinder.Eval(Container.DataItem, "Titolo")%></h2>
						    <div class="photog">
						    <a href="photogallery.aspx?id=<%# DataBinder.Eval(Container.DataItem, "ID")%>" title="<%# DataBinder.Eval(Container.DataItem, "Titolo")%>">
						        <%# Utility.getUrlPhoto(((Oggetti.Oggetto)Container.DataItem).Foto, "w2") %>
						    </a>
						    </div>
						</li>
					</ItemTemplate>
					<FooterTemplate>
					    </ul>
					</FooterTemplate>
        </asp:Repeater>
        </div>        
    </div>
</form>
</asp:Content>