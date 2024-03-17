<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Grit_Management_System.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <main class="main-content  mt-0">
    <div class="page-header align-items-start min-vh-100" style="background-image: url('https://images.unsplash.com/photo-1497294815431-9365093b7331?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80');">
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
                     <asp:TextBox runat="server" type="email" ID="email"  class="form-control" OnTextChanged="email_TextChanged"></asp:TextBox> 
                  </div>
                  <div class="input-group input-group-outline mb-3">
                    <label class="form-label">Password</label>
                    <asp:TextBox runat="server" type="password" ID="password"  class="form-control" OnTextChanged="password_TextChanged"></asp:TextBox> 
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
</asp:Content>
