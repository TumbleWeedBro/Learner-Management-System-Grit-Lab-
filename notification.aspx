<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="notification.aspx.cs" Inherits="Grit_Management_System.notification" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid py-4">
    <form id="form1" runat="server">
     <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
           <div class="card mt-4">
            <div class="card-header p-3">
              <h5 class="mb-0">Attendance code</h5>
            </div>
            <div class="card-body p-3 pb-0">
            <asp:TextBox runat="server" type="text" ID="txtSubAttendance"  class="form-control" OnTextChanged="txtSubAttendance_TextChanged" ></asp:TextBox> 
            
            </div>

        <asp:Button  runat="server" Text="Submit Attendance" type="button" class="btn bg-gradient-warning w-100 my-4 mb-2" ID="btnSubAttendance" OnClick="btnSubAttendance_Click" />
          </div>
        <div class="card mt-4">
            <div class="card-header p-3">
              <h5 class="mb-0">Attendance code</h5>
            </div>
            <div class="card-body p-3 pb-0">
            <asp:TextBox runat="server" type="text" ID="txtattendance"  class="form-control" OnTextChanged="txtattendance_TextChanged" ></asp:TextBox> 
            
            </div>

        <asp:Button  runat="server" Text="Make attendance" type="button" class="btn bg-gradient-warning w-100 my-4 mb-2" ID="Button1" OnClick="btnAttendance_Click" />
          </div>

          <div class="card mt-4">
            <div class="card-header p-3">
              <h5 class="mb-0">Write notification</h5>
            </div>
            <div class="card-body p-3 pb-0">
            <asp:TextBox runat="server" type="text" ID="txtnotification"  class="form-control" OnTextChanged="txtnotification_TextChanged" ></asp:TextBox> 
            
            </div>

        <asp:Button  runat="server" Text="Submit" type="button" class="btn bg-gradient-warning w-100 my-4 mb-2" ID="btnNotification" OnClick="btnNotification_Click" />
          </div>
         
        </div>
      </div>
  

      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="card mt-4">
            <div class="card-header p-3">
              <h5 class="mb-0">Alerts</h5>
            </div>
            <div class="card-body p-3 pb-0">
              <div class="alert alert-dark alert-dismissible text-white" role="alert">
                <asp:GridView ID="GridView1" runat="server" class="table align-items-center mb-0"  AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="24px" AllowPaging="True"  OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="1082px" DataKeyNames="id">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="message" HeaderText="message" SortExpression="message" />
                    <asp:BoundField DataField="sent_date" HeaderText="sent_date" SortExpression="sent_date" />
                    <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:Button ID="btnDelete" OnClick="btnDelete_Click" runat="server" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this record?');" />
                    </ItemTemplate>
                </asp:TemplateField>
                </Columns>
            </asp:GridView>

                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Grit_Management_DBConnectionString %>" SelectCommand="SELECT [message], [sent_date], [id] FROM [notifications]"></asp:SqlDataSource>

              </div>
            </div>
          </div>
         
        </div>
      </div>

   </form>
    </div>

</asp:Content>
