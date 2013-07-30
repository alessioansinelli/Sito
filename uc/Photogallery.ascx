<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Photogallery.ascx.cs"
    Inherits="uc_Photogallery" %>
    <% if (TipoOggetto != TipoOggetto.News)
       { %>
    <h1><% = _TitoloGallery%></h1>
    <div><% = _SottoTitoloGallery%></div>
    <div><% = _TestoGallery%></div>
    <% }
       else if (Galleria.Foto.Length > 0)
       { %>
       <h2>Immagini Collegate</h2> 
     <% } %>
<asp:Repeater ID="repFoto" runat="server">
    <HeaderTemplate>
        <ul class="gallery">
    </HeaderTemplate>
    <ItemTemplate>
        <li class="<%# Utility.getClassname(Container.ItemIndex, 4, "cb first") %>">
            <div class="photodiv">
                <a href="<%# Utility.getPathPhoto((Oggetti.OggettoFoto)(Container.DataItem), "w9") %>" class="photo" title="<%# DataBinder.Eval(Container.DataItem, "Titolo")%>">
                    <%# Utility.getUrlPhoto((Oggetti.OggettoFoto)(Container.DataItem), "w2") %></a>
                </div>
        </li>
    </ItemTemplate>
    <AlternatingItemTemplate>
        <li>
            <div class="photodiv">
                <a href="<%# Utility.getPathPhoto((Oggetti.OggettoFoto)(Container.DataItem), "w9") %>" class="photo" title="<%# DataBinder.Eval(Container.DataItem, "Titolo")%>">
                    <%# Utility.getUrlPhoto((Oggetti.OggettoFoto)(Container.DataItem), "w2") %>
                </a>
            </div>
        </li>
    </AlternatingItemTemplate>
    <FooterTemplate>
        </ul>
    </FooterTemplate>
</asp:Repeater>
<div ID="divPaginazione" runat="server" class="pagfoto">
    
</div>
<script language="javascript" type="text/javascript">
    $(function() { $('.photo').lightBox(); }); 
</script>
