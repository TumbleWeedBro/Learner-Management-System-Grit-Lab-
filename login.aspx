<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Grit_Management_System.login1" %>

<!DOCTYPE html>

<head runat="server">

    <!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />

<!-- Nucleo Icons -->
<link href="./assets/css/nucleo-icons.css" rel="stylesheet" />
<link href="./assets/css/nucleo-svg.css" rel="stylesheet" />

<!-- Font Awesome Icons -->
<script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>

<!-- Material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">

<!-- CSS Files -->



<link id="pagestyle" href="./assets/css/material-dashboard.css?v=3.1.0" rel="stylesheet" />

    


<!--   Core JS Files   -->
<script src="./assets/js/core/popper.min.js" ></script>
<script src="./assets/js/core/bootstrap.min.js" ></script>
<script src="./assets/js/plugins/perfect-scrollbar.min.js" ></script>
<script src="./assets/js/plugins/smooth-scrollbar.min.js" ></script>


</head>
<body>
     <main class="main-content  mt-0">
    <div class="page-header align-items-start min-vh-100" style="background-image: url('../assets/img/illustrations/vecteezy_book-and-studen-logo-vector_6552415.jpg');">
      <span class="mask bg-gradient-dark opacity-6"></span>
      <div class="container my-auto">
        <div class="row">
            
          <div class="col-lg-4 col-md-8 col-12 mx-auto">
            <div class="card z-index-0 fadeIn3 fadeInBottom">
              <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                <div class="bg-gradient-warning shadow-warning border-radius-lg py-3 pe-1">
                  <h4 class="text-white font-weight-bolder text-center mt-2 mb-0">Sign in</h4>
                  <div class="row mt-3">
                    <div class="col-2 text-center ms-auto">
                  </div>
                </div>
              </div>
              <div class="card-body">
                <form role="form" class="text-start" runat="server">
                  <div class="input-group input-group-outline my-3">
                    <label class="form-label">Email</label>
                     <asp:TextBox runat="server" type="email" ID="txtemail"  class="form-control" OnTextChanged="email_TextChanged"></asp:TextBox> 
                  </div>
                  <div class="input-group input-group-outline mb-3">
                    <label class="form-label">Password</label>
                    <asp:TextBox runat="server" type="password" ID="txtpassword"  class="form-control" OnTextChanged="txtpassword_TextChanged" ></asp:TextBox> 
                  </div>
                  <div class="text-center">
                     <asp:Button  runat="server" Text="Login" type="button" OnClick="btnlogin_Click" class="btn bg-gradient-warning w-100 my-4 mb-2" ID="btnlogin" />
                    
                  </div>
                  <p class="mt-4 text-sm text-center">
                    Aren't a member of JBS?
                    <a href="sign_up.aspx" class="text-warning text-gradient font-weight-bold">Request </a>
                  </p>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    </div>
  </main>
</body>

