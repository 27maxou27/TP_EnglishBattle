<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TP_EnglishBattle._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:HiddenField ID="hf_id_joueur" runat="server" Value="" />
    <asp:HiddenField ID="hf_id_partie" runat="server" Value="" />
    <asp:HiddenField ID="hf_niveau" runat="server" Value="" />

    <div class="row text-center">
        <h2 style="font-family: 'Sriracha', cursive;">
            <img src="https://img.icons8.com/officel/40/000000/france.png">
            English Battle
            <img src="https://img.icons8.com/office/40/000000/great-britain.png"></h2>
        <hr />
    </div>

    <%--Panel de début de game--%>
    <asp:Panel ID="newgame_panel" runat="server" Visible="true">
        <div class="row text-center">
            <h3>Bienvenue!</h3>
        </div>
        <div class="row text-center">
            <div class="col-sm-6 col-md-6 col-centered">
                <p>Après avoir cliqué sur <strong>"Jouer"</strong>, vous avez une minute pour trouver le prétérit et participe passé d'un maximum de <strong>verbes irréguliers en anglais</strong>.</p>
                <p>Bonne chance! (<a id="help" href="#">Commencer</a>)</p>
            </div>
        </div>
        <div class="row text-center">
            <div class="col">
                <asp:Button ID="btn_newgame" runat="server" Text="Jouer" CssClass="btn btn-sm btn-success" OnClick="Btn_newgame_Click" />
            </div>
        </div>
    </asp:Panel>

    <%--Panel de Fin de game--%>
    <asp:Panel ID="gameover_panel" runat="server" Visible="false">
        <div class="row text-center">
            <h3>Fin de partie!</h3>
        </div>
        <div class="row text-center">
            <div class="col">
                <span>Votre Score:
                    <label id="gameover_score" runat="server">{SCORE}</label></span>
            </div>
        </div>
        <div class="row text-center">
            <div class="col">
                <a href="/Ladder">Voir le classement</a>
            </div>
        </div>
        <div class="row text-center">
            <asp:Button ID="btn_gameover" runat="server" Text="Nouvelle partie" CssClass="btn btn-sm btn-success" />
        </div>
    </asp:Panel>

    <%--Panel du jeu--%>
    <asp:Panel ID="game_panel" runat="server" Visible="false">

        <%--Timer--%>
        <div id="timer" class="row text-center">
            <div class="col">
                <svg width="140" height="140" xmlns="http://www.w3.org/2000/svg" version="1.1">

                    <defs>
                        <radialGradient id="shadow_3" cx="50%" cy="50%" r="50%" fx="50%" fy="50%">
                            <stop offset="50%" stop-color="#444" stop-opacity="1" />
                            <stop offset="50%" stop-color="#000" stop-opacity="0.3" />
                            <stop offset="55%" stop-color="#000" stop-opacity="0" />

                            <stop offset="90%" stop-color="#000" stop-opacity="0" />
                            <stop offset="100%" stop-color="#000" stop-opacity="0.4" />
                        </radialGradient>
                    </defs>

                    <circle cx="70" cy="70" r="60" fill="#333" />

                    <path id="progress_3" d="" fill="#000" />

                    <rect x="69" y="10" width="2" height="120" fill="#000" fill-opacity="0.5" />
                    <rect x="10" y="69" width="120" height="2" fill="#000" fill-opacity="0.5" />

                    <circle cx="70" cy="70" r="60" fill="url(#shadow_3)" />

                    <text id="seconds_3" x="70" y="80" text-anchor="middle" fill="#fff" style="font-size: 24px; font-family: Arial;">0</text>

                </svg>
            </div>
        </div>

        <%--<div class="row text-center">
            <div class="col">
                <h4>[Messages]</h4>
                <span>[Score]</span>
            </div>
        </div>--%>

        <%--Next Words--%>
        <div class="row text-center top-row">
            <div id="next-words" class="col-md-offset-3 col-md-2 text-center ">
            </div>
        </div>

        <%--Inputs--%>
        <div class="row">
            <div class="col-md-3">
                <!-- Vide -->
            </div>
            <%--Base Verbale--%>
            <div class="<%--col-md-offset-3--%> col-md-2 text-center">
                <div class="row bottom-buffer">
                    <div class="input-icons">
                        <i id="success_icon" class="fas fa-check icon success"></i>
                        <i id="failure_icon" class="fas fa-times icon error"></i>
                        <asp:TextBox ID="txt_word" runat="server" Placeholder="Base verbale" CssClass="text-center"></asp:TextBox>
                    </div>
                </div>
            </div>
            <%--Preterit--%>
            <div class="col-md-2 text-center">
                <div class="row bottom-buffer">
                    <asp:TextBox ID="txt_preterit" runat="server" Placeholder="Prétérit" CssClass="text-center invalid-feedback"></asp:TextBox>
                </div>
            </div>
            <%--Participe Passé--%>
            <div class="col-md-2 text-center">
                <div class="row">
                    <asp:TextBox ID="txt_pp" runat="server" Placeholder="Participe passé" CssClass="text-center"></asp:TextBox>
                </div>
            </div>
            <%--<div class="col-md-3 text-center">
                <span>***</span>
            </div>--%>
        </div>
        <div class="row text-center top-buffer">
            <div class="col">
                <%--<asp:Button ID="btn_play" runat="server" Text="Commencer" UseSubmitBehavior="false" CssClass="btn btn-default" />--%>
                <button id="btn_play" class="btn btn-default" type="button"><i id="btn_loader" class="fa fa-circle-o-notch fa-spin"></i>Chargement</button>
            </div>
        </div>
    </asp:Panel>


    <script type="text/javascript">
        // Pour en voir plus sur la logique de jeu, voir les fichiers dans ~/Scripts/Ressource

        // Initialisation
        $("#btn_play").attr("disabled", true);
        $("#success_icon").hide();
        $("#failure_icon").hide();
        $("#<%= txt_word.ClientID %>").val("");
        $("#<%= txt_word.ClientID %>").attr("disabled", "true");

        $(document).ready(function () {

            // Lance le jeu si le panel de jeu est visible
            if ($("#<%= game_panel.ClientID %>").is(":visible")) {

                // Récupération des infos de la partie
                var idPartie = parseInt($("#<%= hf_id_partie.ClientID %>").val());
                var niveau = parseInt($("#<%= hf_niveau.ClientID %>").val());

                // Creation d'une partie en passant en paramètres les infos de partie + les 3 inputs du jeu
                var englishBattle = new EnglishBattle(idPartie, niveau, $("#<%= txt_word.ClientID %>"), $("#<%= txt_preterit.ClientID %>"), $("#<%= txt_pp.ClientID %>"));
                // Initialisation du timer à 60 secondes
                var _timer = new Timer(5);

                console.log(englishBattle.idPartie);

                // Call AJAX pour récupérer les verbes
                $.ajax({
                    type: "POST",
                    url: "Default.aspx/GetListeVerbes",
                    dataType: "json",
                    contentType: 'application/json; charset=utf-8',
                    // On success
                    success: function (data) {
                        // Initialisation
                        englishBattle.Init(data.d);
                        $("#btn_loader").hide(1500);
                        $("#btn_play").html("Prêt").addClass("btn-success").removeClass("btn-default").attr("disabled", false);
                    },
                    error: function (err) {
                        console.log(err);
                    }
                });

                // --- EVENTS ---

                // Event du boutton "Commencer"
                $("#btn_play").on("click", function (event) {

                    // Faire un truc avec le boutton
                    $("#btn_play").attr("disabled", true);

                    $("#<%= txt_word.ClientID %>").focus();
                    englishBattle.Start(_timer.getTimeStamp());
                    englishBattle.ClearInputs();
                    _timer.start(englishBattle.TimeOut);
                });

                // Event de détéction de la touche "Entrée"
                $(document).on("keypress", function (event) {

                    if (event.key == "Enter" && englishBattle.ReponseNotEmpty()) {

                        var verbe = englishBattle.GetCurrentVerbe();

                        console.log(`${englishBattle.reponseP.val()} | reponse: ${verbe.participePasse}`);
                        console.log(`${englishBattle.reponsePP.val()} | reponse: ${verbe.preterit}`);

                        $.ajax({
                            type: "POST",
                            url: "Default.aspx/PostReponse",
                            dataType: "json",
                            // Objet 'reponse' en JSON renvoyé vers le serveur et déserialisé automatiquement
                            data: englishBattle.GetReponse(_timer.getTimeStamp()),
                            contentType: 'application/json; charset=utf-8',
                            // S'il y a succes, le serveur renvoie un code 'true' ou 'false'
                            success: function (code) {
                                console.log(code.d);

                                if (code.d == true) {
                                    $("#success_icon").fadeIn().fadeOut(1500);
                                }
                                else {
                                    $("#failure_icon").fadeIn().fadeOut(1500);
                                }
                                englishBattle.firstTimestamp = _timer.getTimeStamp();
                                englishBattle.ClearInputs();

                                if (englishBattle.NextWord($("#<%= txt_word.ClientID %>")) == false) {
                                    //englishBattle.EndGame();
                                }
                            },
                            error: function (err) {
                                console.log(err);
                            }
                        });
                    }
                });

                //$(document).on("focusout", function () {
                //    alert("Ne pas tricher!");
                //});
            }
        });
    </script>

</asp:Content>
