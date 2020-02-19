<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TP_EnglishBattle.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="form-horizontal content-wrapper">
         <%--<div id="alert_error_conn" runat="server" visible="false" class="row">
            <div class="alert alert-error">
                <strong>Success!</strong> Compte crée avec l'email <span ID="alert_email" runat="server"></span>
            </div>
        </div>--%>

        <h1 id="title">Inscription</h1>

        <%--Nom--%>
        <div class="form-group row">
            <div class="col-md-3">
                <asp:Label ID="lbl_nom" runat="server" AssociatedControlID="txt_nom" CssClass="control-label">Nom:</asp:Label>
            </div>
            <div class="col-md-5">
                <asp:TextBox ID="txt_nom" runat="server" CssClass="form-control" MaxLength="200"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_nom"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="txt_nom"
                    ErrorMessage="Le champ est requis"
                    CssClass="asp-error"></asp:RequiredFieldValidator>
            </div>
        </div>

        <%--Prenom--%>
        <div class="form-group row">
            <div class="col-md-3">
                <asp:Label ID="lbl_prenom" runat="server" AssociatedControlID="txt_prenom" CssClass="control-label">Prenom:</asp:Label>
            </div>
            <div class="col-md-5">
                <asp:TextBox ID="txt_prenom" runat="server" CssClass="form-control" MaxLength="200"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_prenom"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="txt_prenom"
                    ErrorMessage="Le champ est requis"
                    CssClass="asp-error"></asp:RequiredFieldValidator>
            </div>
        </div>

        <%--Email--%>
        <div class="form-group row">
            <div class="col-md-3">
                <asp:Label ID="lbl_email" runat="server" AssociatedControlID="txt_email" CssClass="control-label">Email:</asp:Label>
            </div>
            <div class="col-md-5">
                <asp:TextBox ID="txt_email" runat="server" TextMode="Email" CssClass="form-control" autocomplete="off" MaxLength="300"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_email"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="txt_email"
                    ErrorMessage="Le champ est requis"
                    CssClass="asp-error"></asp:RequiredFieldValidator>
                <span ID="err_email" runat="server" class="custom-error" visible="false">Cet Email est déjà utilisé</span>
            </div>
        </div>

        <%--Mot de passe--%>
        <div class="form-group row">
            <div class="col-md-3">
                <asp:Label ID="lbl_mdp" runat="server" AssociatedControlID="txt_mdp" CssClass="control-label">Mot de passe:</asp:Label>
            </div>
            <div class="col-md-5">
                <asp:TextBox ID="txt_mdp" runat="server" TextMode="Password" CssClass="form-control" autocomplete="off" MaxLength="50"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_mdp"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="txt_mdp"
                    ErrorMessage="Le champ est requis"
                    CssClass="asp-error"></asp:RequiredFieldValidator>
            </div>
        </div>

        <%--Ville--%>
        <div class="form-group row">
            <%--<div class="col-md-3">
                <asp:Label ID="lbl_ville" runat="server" AssociatedControlID="ddl_ville" CssClass="control-label">Ville:</asp:Label>
            </div>--%>
            <div class="col-md-5 col-md-offset-3">
                <asp:DropDownList ID="ddl_ville" runat="server" CssClass="form-control"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfv_ville"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="ddl_ville"
                    ErrorMessage="Le champ est requis"
                    InitialValue=""
                    CssClass="asp-error"></asp:RequiredFieldValidator>
            </div>
        </div>

         <%--Niveau--%>
        <div class="form-group row">
            <%--<div class="col-md-3">
                <asp:Label ID="lbl_niveau" runat="server" AssociatedControlID="ddl_niveau" CssClass="control-label">Niveau:</asp:Label>
            </div>--%>
            <div class="col-md-5 col-md-offset-3">
                <asp:DropDownList ID="ddl_niveau" runat="server" CssClass="form-control">
                    <asp:ListItem Text="-- Choisir Niveau --" Value="" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Débutant" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Intermédiaire" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Expert" Value="2"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfv_niveau"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="ddl_niveau"
                    ErrorMessage="Le champ est requis"
                    InitialValue=""
                    CssClass="asp-error"></asp:RequiredFieldValidator>
            </div>
        </div>

        <%--Boutton submit--%>
        <div class="form-group row">
            <div class="col-md-5 col-md-offset-3">
                <asp:Button ID="btn_submit" runat="server" Text="Valider" CausesValidation="true" OnClick="Btn_submit_OnClick" CssClass="btn btn-default"/>
            </div>
        </div>


    </div>

    <script type="text/javascript">

        $(document).ready(function () {

            $(".custom-error").delay(3000).fadeOut()

        });

    </script>

</asp:Content>
