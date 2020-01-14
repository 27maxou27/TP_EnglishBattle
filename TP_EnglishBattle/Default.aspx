<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TP_EnglishBattle._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <style type="text/css">
        .auto-style1 {
            height: 197px;
        }

        .center {
            float : none;
            margin : 0 auto;
        }

        .auto-style2 {
            /*display: block;*/
            padding: 6px 12px;
            /*font-size: 14px;*/
            line-height: 1.42857143;
            color: #555;
            background-color: #fff;
            background-image: none;
            margin-right: 10px;
            margin-top: 50px;
            align-content: center;
            border: 1px solid #ccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
            -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
        }
    </style>

    <div class="form-group row">
        <div class="col text-center">
            <asp:Label runat="server" ID="Score"></asp:Label>
        </div>
    </div>
    <div class="form-group row">
        <div class="col text-center">
            <asp:Label runat="server" ID="Question"></asp:Label>
        </div>
    </div>
    <div class="form-group row">
        <div class="text-center">
            <div class="col-md-4 text-center ">
                <asp:TextBox runat="server" ID="Preterit" CssClass="auto-style2" Width="287px" />
            </div>
            <div class="col-md-3 col-md-offset-3 text-center ">
                <asp:TextBox runat="server" ID="ParticipeP" CssClass="auto-style2" Width="287px" />
            </div>

            <%-- <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                                CssClass="text-danger" ErrorMessage="Le champ du nom d'utilisateur est obligatoire." />--%>
        </div>
    </div>
    <div class="form-group row">
        <div class="col text-center">

            <asp:Button ID="Submit" runat="server" OnClick="Submit_OnClick" Text="Envoyer" CssClass="btn btn-default" />

        </div>
    </div>





</asp:Content>
