<%@ Page Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TP_EnglishBattle.Login" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="form-horizontal content-wrapper">
        <div id="alert_success" runat="server" visible="false" class="row">
            <div class="alert alert-success">
                <strong>Success!</strong> Compte crée avec l'email <span ID="alert_email" runat="server"></span>
            </div>
        </div>

        <h1 id="title">Login</h1>

        <%--Email--%>
        <div class="form-group row">
            <div class="col-md-3">
                <asp:Label ID="lbl_email" runat="server" AssociatedControlID="txt_email" CssClass="control-label">Email</asp:Label>
            </div>
            <div class="col-md-5">
                <asp:TextBox ID="txt_email" runat="server" TextMode="Email" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_email"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="txt_email"
                    ErrorMessage="Veuillez renseigner votre email"
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>

        <%--Mot de passe--%>
        <div class="form-group row">
            <div class="col-md-3">
                <asp:Label ID="lbl_mdp" runat="server" AssociatedControlID="txt_mdp" CssClass="control-label">Mot de passe</asp:Label>
            </div>
            <div class="col-md-5">
                <asp:TextBox ID="txt_mdp" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_mdp"
                    runat="server"
                    Display="Dynamic"
                    ControlToValidate="txt_mdp"
                    ErrorMessage="Veuillez renseigner votre mot de passe"
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>

        <%--Boutton submit--%>
        <div class="row vertical-align">
            <div class="col-md-1 col-md-offset-3">
                <asp:Button ID="btn_submit" runat="server" Text="Valider" CausesValidation="true" OnClick="btn_submit_OnClick" CssClass="btn btn-default" />
            </div>
            <div class="col-md-offset-1">
                <div class="checkbox-inline">
                    <span>
                        <asp:CheckBox ID="cb_remember" runat="server" />
                        Rester connecté
                    </span>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-5 col-md-offset-3">
                <hr />
                <span>Nouveau ?
                    <asp:HyperLink ID="hl_register" runat="server" NavigateUrl="~/Register.aspx" Text="S'inscrire" CssClass="btn btn-link"></asp:HyperLink></span>
            </div>
        </div>

    </div>

    <script type="text/javascript">

        $(document).ready(function () {

            $(".alert").delay(3000).fadeOut()

        });

    </script>

</asp:Content>
