<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="gritters.aspx.cs" Inherits="Grit_Management_System.gritters" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
     <form id="form1" runat="server">
    <div class="container-fluid py-4">
      <div class="row">
        <div class="col-12">
          <div class="card my-4">
            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
              <div class="bg-gradient-warning shadow-warning border-radius-lg pt-4 pb-3">
                <h6 class="text-white text-capitalize ps-3">Gritters table</h6>
              </div>
            </div>
              <div class="table-responsive" style="padding-left:8vh;">

            
                <div class="row">
                    <div class="col">
                        <asp:GridView ID="GridView1" runat="server" class="table align-items-center mb-0" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="222px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="gritters_id" AllowPaging="True">
                            <Columns>
                                <asp:BoundField DataField="gritters_id" HeaderText="gritters_id" ReadOnly="True" SortExpression="gritters_id" />
                                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                                <asp:BoundField DataField="surname" HeaderText="Surname" SortExpression="surname" />
                                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                <asp:BoundField DataField="account_status" HeaderText="Account Status" SortExpression="account_status" />
                                <asp:HyperLinkField HeaderText="Analytics" DataNavigateUrlFields="gritters_id" Text="View" DataNavigateUrlFormatString="~/users_view.aspx?gritters_id={0}" />
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <asp:Button runat="server" class="btn btn-success btn-md" style="padding-left: 0.5rem; padding-right: 0.5rem;" Text="Activate" OnClick="btnActivate_Click"/>
                                        <asp:Button runat="server" class="btn btn-warning btn-md" style="padding-left: 0.5rem; padding-right: 0.5rem;" Text="Suspend" OnClick="btnSuspend_Click"/>
                                        <asp:Button runat="server" class="btn btn-danger btn-md" style="padding-left: 0.5rem; padding-right: 0.5rem;" Text="Delete" OnClick="btnDelete_Click"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Grit_Management_DBConnectionString %>" SelectCommand="SELECT [gritters_id], [name], [surname], [email], [account_status] FROM [grituser] WHERE ([account_status] = @account_status)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="active" Name="account_status" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>


          
          </div>
          </div>
         </div>

                  <div class="col-12">
          <div class="card my-4">
            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
              <div class="bg-gradient-warning shadow-warning border-radius-lg pt-4 pb-3">
                <h6 class="text-white text-capitalize ps-3">Requests table</h6>
              </div>
            </div>
              <div class="table-responsive" style="padding-left:8vh;">
                <div class="row">
                    <div class="col">
                        <asp:GridView ID="GridView2" runat="server" class="table align-items-center mb-0" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Height="222px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="gritters_id" AllowPaging="True">
                            <Columns>
                                <asp:BoundField DataField="gritters_id" HeaderText="gritters_id" ReadOnly="True" SortExpression="gritters_id" />
                                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                <asp:BoundField DataField="surname" HeaderText="surname" SortExpression="surname" />
                                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                                <asp:BoundField DataField="account_status" HeaderText="account_status" SortExpression="account_status" />
                                 <asp:HyperLinkField HeaderText="Analytics" DataNavigateUrlFields="gritters_id" Text="View" DataNavigateUrlFormatString="~/users_view.aspx?gritters_id={0}" />
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <asp:Button runat="server" class="btn btn-success btn-md" style="padding-left: 0.5rem; padding-right: 0.5rem;" Text="Activate" OnClick="btnActivate_Click"/>
                                        <asp:Button runat="server" class="btn btn-warning btn-md" style="padding-left: 0.5rem; padding-right: 0.5rem;" Text="Suspend" OnClick="btnSuspend_Click"/>
                                        <asp:Button runat="server" class="btn btn-danger btn-md" style="padding-left: 0.5rem; padding-right: 0.5rem;" Text="Delete" OnClick="btnDelete_Click"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Grit_Management_DBConnectionString %>" SelectCommand="SELECT [gritters_id], [name], [surname], [email], [account_status] FROM [grituser] WHERE ([account_status] = @account_status)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="pending" Name="account_status" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
          </div>
          </div>
         </div>
         </div>

      </div>
    </form>
</main>


</asp:Content>
