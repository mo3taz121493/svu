<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataMinningPage.aspx.cs" Inherits="TestDB.DataMinningPage" %>

<!DOCTYPE html>

<html>
<head>
    <title>Classifier ID3 and Bayes</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-select.css">
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Heart Deasese , SVU , WDE , Home Work" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //for-mobile-apps -->
    <!--fonts-->
    <link href='//fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'>
    <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
    <!--//fonts-->
   
    <link rel="stylesheet" type="text/css" href="css/easy-responsive-tabs.css " />
    <script src="js/easyResponsiveTabs.js"></script>
</head>
<body>
    <div class="banner text-center">
        <div class="container">
            <h1 style="color: #5f85c6;">Enter your    <span class="segment-heading">Information     </span> </h1>
            <p style="color: #6e7b87;">Show the result on both Algorithm  Bayes Classifier and ID3 Classifier</p>
        </div>
    </div>
    <br />
    <br />
    <form id="f1" runat="server">
        <div class="submit-ad main-grid-border">
            <div class="container">

                <asp:DropDownList ID="algo" runat="server" style="margin-left :500px ; border-radius:30px ; width:200px ; height:50px ; text-align:center ; padding-left:40px">
                    <asp:ListItem Text="Bayes Algorithm" Value="1" />
                     <asp:ListItem Text="ID3 Algorithm" Value="0" />
                </asp:DropDownList>
                <br />
                <br />

                    


                <div>
                    <div class="alert alert-success" Visible="false" >
                        <strong>
                            <asp:Label ID="l1" runat="server" Text=" Here Goes The Result" style="text-align:center; padding-left:400px" ></asp:Label></strong>
                    </div>

                    <br />
                    <br />
                    <div class="panel-body">

                  </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">Age <span style="color: red;">* </span></label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="t1" runat="server" class="form-control" placeholder="Age" type="text" ValidateRequestMode="Enabled" ></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <br />

                        <div class="form-group">
                            <label class="col-sm-2 control-label">Chest Pain Type <span style="color: red;">* </span></label>
                            <div class="col-sm-10">
                                <label class="styled-select">
                                    <asp:DropDownList ID="d1" runat="server" class="form-control">
                                        <asp:ListItem Text="Asymptomatic" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Typical type angina" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Non-angina pain" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </label>
                            </div>
                        </div>
                        <br />
                        <br />

                        <div class="form-group">
                            <label class="col-sm-2 control-label">Rest Blood Pressure  <span style="color: red;">* </span></label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="t2" runat="server" class="form-control" type="text" placeholder="Rest Blood Pressure" ValidateRequestMode="Enabled" ></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <br />

                        <div class="form-group">
                            <label class="col-sm-2 control-label">Fasting Blood Sugar  <span style="color: red;">* </span></label>
                            <div class="col-sm-10">

                                <label class="styled-select">
                                    <asp:DropDownList ID="t4" runat="server" class="form-control">
                                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </label>
                            </div>

                        </div>


                        <br />
                        <br />

                        <div class="form-group">
                            <label class="col-sm-2 control-label">Resting Electro  <span style="color: red;">* </span></label>
                            <div class="col-sm-10">
                                <label class="styled-select">

                                    <asp:DropDownList ID="DropDownList1" runat="server" class="form-control">
                                        <asp:ListItem Text="Normal" Value="0"></asp:ListItem>
                                        <asp:ListItem Text=" Left ventricular hypertrophy" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="ST-T wave abnormality" Value="2"></asp:ListItem>
                                    </asp:DropDownList>
                                </label>
                            </div>
                        </div>
                        <br />
                        <br />


                        <div class="form-group">
                            <label class="col-sm-2 control-label">Max Heart Rate  <span style="color: red;">* </span></label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="t3" runat="server" class="form-control" placeholder="Max Heart Rate" type="text" ValidateRequestMode="Enabled" ></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <br />

                        <div class="form-group">
                            <label class="col-sm-2 control-label">Exercise Angina  <span style="color: red;">* </span></label>
                            <div class="col-sm-10">

                                <label class="styled-select">
                                    <asp:DropDownList ID="DropDownList2" runat="server" class="form-control">
                                        <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </label>

                            </div>
                        </div>
                        <br />
                        <br />

                        <div class="form-group">
                           <asp:Button class="btn btn-info" ID="b2" runat="server" Text="Submit" OnClick="b2_Click" Style="width:100px ; margin-left:50% " /> 
                        </div>
                        
                                
                          
                    

                    </div>

                </div>
            </div>
        
    </form>


    <footer class="footer center-block footer-bottom">

        <!-- Copyright -->
        <div class="footer-copyright text-center py-3" style="color:white">
            © 2020 Copyrigh 
            Made By SVU Students [Lora][Shaza][Motaz]
   
        </div>
        <!-- Copyright -->

    </footer>
</body>
</html>
<!-- js -->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <!-- js -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-select.js"></script>
    <script>
        $(document).ready(function () {
            var mySelect = $('#first-disabled2');

            $('#special').on('click', function () {
                mySelect.find('option:selected').prop('disabled', true);
                mySelect.selectpicker('refresh');
            });

            $('#special2').on('click', function () {
                mySelect.find('option:disabled').prop('disabled', false);
                mySelect.selectpicker('refresh');
            });

            $('#basic2').selectpicker({
                liveSearch: true,
                maxOptions: 1
            });
        });
    </script>
    <script type="text/javascript" src="js/jquery.leanModal.min.js"></script>
 
    <link href="css/jquery.uls.css" rel="stylesheet" />
    <link href="css/jquery.uls.grid.css" rel="stylesheet" />
    <link href="css/jquery.uls.lcd.css" rel="stylesheet" />
    <!-- Source -->
    <script src="js/jquery.uls.data.js"></script>
    <script src="js/jquery.uls.data.utils.js"></script>
    <script src="js/jquery.uls.lcd.js"></script>
    <script src="js/jquery.uls.languagefilter.js"></script>
    <script src="js/jquery.uls.regionfilter.js"></script>
    <script src="js/jquery.uls.core.js"></script>
    <script>
        $(document).ready(function () {
            $('.uls-trigger').uls({
                onSelect: function (language) {
                    var languageName = $.uls.data.getAutonym(language);
                    $('.uls-trigger').text(languageName);
                },
                quickList: ['en', 'hi', 'he', 'ml', 'ta', 'fr'] 
            });
        });
    </script>