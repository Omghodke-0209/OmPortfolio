<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
        .bgImg{
            background-image:url('images/ape0.png');
            background-size:cover;
        }
    </style>
    <link href="Content/signin.css" rel="stylesheet" />
</head>
<body class="text-center bgImg">
    <form id="form1" runat="server" class="form-signin shadow-lg bg-white">
        <div class="row col-md-12">
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
        <img class="mb-4" src="images/logo4.jpg" alt="" width="80" height="80"/>
        <h1 class="h3 mb-3 font-weight-normal text-danger">Piaggio Vehicle Showroom</h1>
        <h3>Please Sign In</h3>
        <asp:TextBox ID="txtEmail" TextMode="Email" runat="server" CssClass="form-control" placeholder="Email address" autofocus></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control mt-3" placeholder="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <asp:Button ID="btnSignIn" runat="server" Text="Sign in" CssClass="btn btn-lg btn-primary btn-block" OnClick="btnSignIn_Click" />
        <p class="mt-5 mb-3 text-muted">Designed and Developed By OM GHODKE & VISHAL TANTARPALE</p>
    </form>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>
