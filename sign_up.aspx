<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sign_up.aspx.cs" Inherits="Grit_Management_System.sign_up1" %>

<!DOCTYPE html>
<html lang="en">
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
    <section>
      <div class="page-header min-vh-100">
        <div class="container">
          <div class="row">
            <div class="col-6 d-lg-flex d-none h-100 my-auto pe-0 position-absolute top-0 start-0 text-center justify-content-center flex-column">
              <div class="position-relative bg-gradient-primary h-100 m-3 px-7 border-radius-lg d-flex flex-column justify-content-center" style=" background-image: url('../assets/img/illustrations/vecteezy_book-and-studen-logo-vector_6552415.jpg'); background-size: cover;">
              </div>
               
              
            </div>
            <div class="col-xl-4 col-lg-5 col-md-7 d-flex flex-column ms-auto me-auto ms-lg-auto me-lg-5">
              <div class="card card-plain">
                <div class="card-header">
                  <h4 class="font-weight-bolder">Request Form</h4>
                  <p class="mb-0">Enter your details to request to join JBS</p>
                </div>
                <div class="card-body">
                  <form id="form" runat="server" method="post" class="container-fluid">
                    <div class="input-group input-group-outline mb-3">
                      <label class="form-label">Name</label>
                        <asp:TextBox runat="server" type="text" ID="txtname"  class="form-control"  ></asp:TextBox> 
                    </div>
                    <div class="input-group input-group-outline mb-3">
                      <label class="form-label">Surname</label>
                        <asp:TextBox runat="server" type="text" ID="txtsurname"  class="form-control" ></asp:TextBox> 
                    </div>
                    <div class="input-group input-group-outline mb-3">
                      <label class="form-label">Email</label>
                        <asp:TextBox runat="server" type="email" ID="txtemail"  class="form-control" ></asp:TextBox>
                    </div>
                    <div class="input-group input-group-outline mb-3">
                      <label class="form-label">Student Number </label>
                        <asp:TextBox runat="server" type="text" ID="txtstudentNumber"  class="form-control"></asp:TextBox>
                      
                    </div>
                    <div class="input-group input-group-outline mb-3">
                      <label class="form-label">Uni Year</label>
                        <asp:TextBox runat="server" type="text" ID="txtuni_year"  class="form-control" ></asp:TextBox>
                      
                    </div>
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-building"></i> </span>
                        </div>
                        <asp:DropDownList runat="server" ID="ddlCourse" CssClass="form-control" ClientIDMode="Static" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged">
                            <asp:ListItem Text="Select Course" Value="Select Course" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Comp Sci" Value="Comp Sci"></asp:ListItem>
                            <asp:ListItem Text="Info Systems" Value="Info Systems"></asp:ListItem>
                            <asp:ListItem Text="Humanities" Value="Humanities"></asp:ListItem>
                            <asp:ListItem Text="Business" Value="Business"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="input-group input-group-outline mb-3">
                      <label class="form-label">Course Average</label>
                      <asp:TextBox runat="server" type="text" ID="txtCourseAverage"  class="form-control" ></asp:TextBox>
                    </div>
                    <div class="input-group input-group-outline mb-3">
                      <label class="form-label">Motivation to Join JBS</label>
                        <asp:TextBox runat="server" type="text" ID="txtmotivation"  class="form-control"></asp:TextBox>
                    </div>
                    <div class="input-group input-group-outline mb-3">
                      <label class="form-label">Password</label>
                        <asp:TextBox runat="server" type="password" ID="txtpassword"  class="form-control" OnTextChanged="txtpassword_TextChanged" ></asp:TextBox>
                    </div>
                    <div class="text-center">
                       <asp:Button  runat="server" Text="Request" type="submit" OnClick="btnrequest_Click" class="btn bg-gradient-primary w-100 my-4 mb-2" ID="btnrequest" />
                    </div>
                    <p class="mt-4 text-sm text-center">
                        Already a member?
                         <a href="login.aspx" class="text-warning text-gradient font-weight-bold">login</a>
                    </p>

                  </form>
                </div>

              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
</body>
</html>


    