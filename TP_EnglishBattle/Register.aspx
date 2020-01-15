<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TP_EnglishBattle.Register1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="form-horizontal content-wrapper">

        <h1>Inscription</h1>

        <%--Nom--%>
        <div class="form-group row">
            <div class="col-md-4">
                <asp:Label ID="lbl_nom" runat="server" AssociatedControlID="txt_nom" CssClass="control-label">Nom:</asp:Label>
            </div>
            <div class="col-md-4">
                <asp:TextBox ID="txt_nom" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <%--Validation Nom--%>
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <asp:RequiredFieldValidator ID="rfv_nom"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="txt_nom"
                    ErrorMessage="Le champ est requis"
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>

        <%--Prenom--%>
        <div class="form-group row">
            <div class="col-md-4">
                <asp:Label ID="lbl_prenom" runat="server" AssociatedControlID="txt_prenom" CssClass="control-label">Prenom:</asp:Label>
            </div>
            <div class="col-md-4">
                <asp:TextBox ID="txt_prenom" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <%--Validation Prenom--%>
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <asp:RequiredFieldValidator ID="rfv_prenom"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="txt_prenom"
                    ErrorMessage="Le champ est requis"
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>

        <%--Email--%>
        <div class="form-group row">
            <div class="col-md-4">
                <asp:Label ID="lbl_email" runat="server" AssociatedControlID="txt_email" CssClass="control-label">Email:</asp:Label>
            </div>
            <div class="col-md-4">
                <asp:TextBox ID="txt_email" runat="server" TextMode="Email" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <%--Validation Email--%>
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <asp:RequiredFieldValidator ID="rfv_email"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="txt_email"
                    ErrorMessage="Le champ est requis"
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>

        <%--Mot de passe--%>
        <div class="form-group row">
            <div class="col-md-4">
                <asp:Label ID="lbl_mdp" runat="server" AssociatedControlID="txt_mdp" CssClass="control-label">Mot de passe:</asp:Label>
            </div>
            <div class="col-md-4">
                <asp:TextBox ID="txt_mdp" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <%--Validation Mot de passe--%>
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <asp:RequiredFieldValidator ID="rfv_mdp"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="txt_mdp"
                    ErrorMessage="Le champ est requis"
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>

        <%--Niveau--%>
        <div class="form-group row">
            <div class="col-md-4">
                <asp:Label ID="lbl_niveau" runat="server" AssociatedControlID="ddl_niveau" CssClass="control-label">Niveau:</asp:Label>
            </div>
            <div class="col-md-4 <%--col-md-offset-4--%>">
                <asp:DropDownList ID="ddl_niveau" runat="server" CssClass="form-control">
                    <asp:ListItem Text="-- Choisir --" Value="" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Débutant" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Intermédiaire" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Expert" Value="2"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <%--Validation Niveau--%>
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <asp:RequiredFieldValidator ID="rfv_niveau"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="ddl_niveau"
                    ErrorMessage="Le champ est requis"
                    InitialValue=""
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>

        <%--Ville--%>
        <div class="form-group row">
            <div class="col-md-4">
                <asp:Label ID="lbl_ville" runat="server" AssociatedControlID="ddl_ville" CssClass="control-label">Ville:</asp:Label>
            </div>
            <div class="col-md-4 <%--col-md-offset-4--%>">
                <asp:DropDownList ID="ddl_ville" runat="server" CssClass="form-control">
                    <asp:ListItem Text="-- Choisir --" Value="" Selected="True"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <%--Validation Ville--%>
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <asp:RequiredFieldValidator ID="rfv_ville"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="ddl_ville"
                    ErrorMessage="Le champ est requis"
                    InitialValue=""
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>

        <%--Boutton submit--%>
        <div class="form-group row">
            <div class="col-md-4 col-md-offset-4">
                <asp:Button ID="btn_submit" runat="server" Text="Valider" CausesValidation="true" OnClick="Btn_submit_OnClick"/>
            </div>
        </div>


    </div>

</asp:Content>
