<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="gritters.aspx.cs" Inherits="Grit_Management_System.gritters" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<<<<<<< Updated upstream

 <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
=======
        <form id="form1" runat="server">
     <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
>>>>>>> Stashed changes
    <div class="container-fluid py-4">

      <div class="row">
        <div class="col-12">
          <div class="card my-4">
            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
              <div class="bg-gradient-warning shadow-warning border-radius-lg pt-4 pb-3">
                <h6 class="text-white text-capitalize ps-3">Gritters table</h6>
              </div>
            </div>
<<<<<<< Updated upstream
            <div class="card-body px-0 pb-2">
              <div class="table-responsive p-0">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Gritters</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">JBS-CODE</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Status</th>
                        <%--3 status... Top programing talent(TPT), Programming Talent (PT), Certificate (CERT) it should be based on averages--%>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Analytics</th>
                      <th class="text-secondary opacity-7"></th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>
                        <div class="d-flex px-2 py-1">
                          <div>
                           <svg xmlns="http://www.w3.org/2000/svg" width="40" height="30" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                              <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"/>
                              <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"/>
                            </svg>
                          </div>
                          <div class="d-flex flex-column justify-content-center" style="margin-left:2vh;">
                            <h6 class="mb-0 text-sm">John Michael</h6>
                            <p class="text-xs text-secondary mb-0">john@creative-tim.com</p>
                          </div>
                      </div>
                      </td>
                      <td>
                        <p class="text-xs font-weight-bold mb-0">Manager</p>
                      </td>
                      <td class="align-middle text-center text-sm">
                        <span class="badge badge-sm bg-gradient-success">TPT</span>
                      </td>

                      <td style="padding-left:25vh;">
                        <a href="javascript:;" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">
                          View
                        </a>
                      </td>
                    </tr>
                      <%--LOOP ENDS HERE--%>
                      
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-12">
          <div class="card my-4">
            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
              <div class="bg-gradient-warning shadow-warning border-radius-lg pt-4 pb-3">
                <h6 class="text-white text-capitalize ps-3">Content table</h6>
              </div>
            </div>
            <div class="card-body px-0 pb-2">
              <div class="table-responsive p-0">
                 <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Video</th>              
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"></th>              
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Lab links</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Completion</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"></th>
                    </tr>
                  </thead>
                  <tbody>
                      <%--table data--%>
                    <tr>
                      <td>
                        <div class="d-flex px-2 py-1">
                          <div>
                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-camera-reels" viewBox="0 0 16 16">
                              <path d="M6 3a3 3 0 1 1-6 0 3 3 0 0 1 6 0M1 3a2 2 0 1 0 4 0 2 2 0 0 0-4 0"/>
                              <path d="M9 6h.5a2 2 0 0 1 1.983 1.738l3.11-1.382A1 1 0 0 1 16 7.269v7.462a1 1 0 0 1-1.406.913l-3.111-1.382A2 2 0 0 1 9.5 16H2a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2zm6 8.73V7.27l-3.5 1.555v4.35zM1 8v6a1 1 0 0 0 1 1h7.5a1 1 0 0 0 1-1V8a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1"/>
                              <path d="M9 6a3 3 0 1 0 0-6 3 3 0 0 0 0 6M7 3a2 2 0 1 1 4 0 2 2 0 0 1-4 0"/>
                            </svg>
                          </div>
                          <iv class="d-flex flex-column justify-content-center"/>
                            <h6 class="mb-0 text-sm" style="margin-left:2vh; margin-top:0.5vh;">Video Name</h6>
                          </div>
                      </td>

                      <td class="align-middle text-center text-sm">
                        <span class="text-xs font-weight-bold"> Delete </span>
                      </td>
=======
              <div class="table-responsive" style="padding-left:8vh;">

      
                <div class="row">
                    <div class="col">
                        <asp:GridView ID="GridView1" runat="server" class="table align-items-center mb-0" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="222px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="gritters_id">
                            <Columns>
                                <asp:BoundField DataField="gritters_id" HeaderText="gritters_id" SortExpression="gritters_id" InsertVisible="False" ReadOnly="True" />
                                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                <asp:BoundField DataField="surname" HeaderText="surname" SortExpression="surname" />
                                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                                <asp:BoundField DataField="account_status" HeaderText="account_status" SortExpression="account_status" />
                                <asp:BoundField DataField="account_status" HeaderText="account_status" SortExpression="account_status" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Grit_Management_DBConnectionString %>" SelectCommand="SELECT [gritters_id], [name], [surname], [email], [account_status] FROM [grituser] WHERE ([account_status] NOT LIKE '%' + @account_status + '%')">
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

    <div class="container-fluid py-4">
      <div class="row">
        <div class="col-12">
          <div class="card my-4">
            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
              <div class="bg-gradient-warning shadow-warning border-radius-lg pt-4 pb-3">
                <h6 class="text-white text-capitalize ps-3">Request table</h6>
              </div>
            </div>
              <div class="table-responsive" style="padding-left:8vh;">

                  
                <div class="row">
                    <div class="col">
                        <asp:GridView ID="GridView2" runat="server" class="table align-items-center mb-0" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="222px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="gritters_id">
                            <Columns>     
                                <asp:BoundField DataField="gritters_id" HeaderText="gritters_id" SortExpression="gritters_id" InsertVisible="False" ReadOnly="True" />
                                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                                <asp:BoundField DataField="surname" HeaderText="surname" SortExpression="surname" />
                                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                                <asp:BoundField DataField="account_status" HeaderText="account_status" SortExpression="account_status" />
                                 <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:Button runat="server" class="btn btn-success btn-md" style="padding-left: 0.5rem; padding-right: 0.5rem;" Text="Activate" OnClick="btnActivate_Click"/>
                                    <asp:Button runat="server" class="btn btn-warning btn-md" style="padding-left: 0.5rem; padding-right: 0.5rem;" Text="Suspend" OnClick="btnSuspend_Click"/>
                                    <asp:Button runat="server" class="btn btn-danger btn-md" style="padding-left: 0.5rem; padding-right: 0.5rem;" Text="Delete" OnClick="btnDelete_Click"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Grit_Management_DBConnectionString %>" SelectCommand="SELECT [gritters_id], [name], [surname], [email], [account_status] FROM [grituser] WHERE ([account_status] = @account_status)">
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
</main>
</form>
>>>>>>> Stashed changes

                      <td class="align-middle text-center text-sm">
                        <span class="text-xs font-weight-bold"> $14,000 </span>
                      </td>
                      <td class="align-middle">
                        <div class="progress-wrapper w-75 mx-auto">
                          <div class="progress-info">
                            <div class="progress-percentage" style="margin-left:20vh;">
                              <span class="text-xs font-weight-bold">60%</span>
                            </div>
                          </div>
                          <div class="progress" style="margin-left:20vh;">
                              <%--w-0 control progress bar--%>
                            <div class="progress-bar bg-gradient-info w-60" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                          </div>
                        </div>
                      </td>
                    </tr>                        
                  </tbody>
                </table>
              </div>
               <%--end of table--%>
              </div>
            </div>
          </div>
       </div>
     </div>
  </main>
</asp:Content>
