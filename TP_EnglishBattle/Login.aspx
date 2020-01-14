<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="form-horizontal content-wrapper">

        <h1>Login</h1>

        <%--Email--%>
        <div class="form-group row">
            <div class="col-md-4">
                <asp:Label ID="lbl_email" runat="server" AssociatedControlID="txt_email" CssClass="control-label">Email</asp:Label>
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
                    ErrorMessage="Veuillez renseigner votre email"
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>

        <%--Mot de passe--%>
        <div class="form-group row">
            <div class="col-md-4">
                <asp:Label ID="lbl_mdp" runat="server" AssociatedControlID="txt_mdp" CssClass="control-label">Mot de passe</asp:Label>
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
                    ErrorMessage="Veuillez renseigner votre mot de passe"
                    ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>

        <%--Boutton submit--%>
        <div class="form-group row">
            <div class="col-md-4 col-md-offset-4">
                <asp:Button ID="btn_submit" runat="server" Text="Valider" CausesValidation="true" OnClick="btn_submit_Click" CssClass="btn btn-default"/>
            </div>
        </div>

    </div>

</asp:Content>

