<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="upload.aspx.cs" Inherits="Grit_Management_System.upload" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <form id="form" runat="server" enctype="multipart/form-data" method="post" class="container-fluid">
            <div class="col-12">
                <div class="card my-4">
                    <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                        <div class="card card-plain">
                            <div class="card-header">
                                <h4 class="font-weight-bolder">&nbsp;Upload form</h4>
                                <p class="mb-0">Enter your details to request to join JBS</p>
                            </div>
                            <div class="card-body">
                                <div class="input-group input-group-outline mb-3">
                                    <label class="form-label">Video Name</label>
                                    <asp:TextBox runat="server" type="text" ID="txtVideo_name" class="form-control" OnTextChanged="txtVideo_name_TextChanged"></asp:TextBox>
                                </div>
                                <div class="input-group input-group-outline mb-3">
                                    <label class="form-label">Lab link</label>
                                    <asp:TextBox runat="server" type="text" ID="txtLab_link" class="form-control" OnTextChanged="txtLab_link_TextChanged"></asp:TextBox>
                                </div>

                                <div class="text-center">
                                    
                                    <asp:Button runat="server" Text="Submit" type="submit" class="btn bg-gradient-primary w-100 my-4 mb-2" ID="btnSubmit" OnClick="btnSubmit_Click" />
                                </div>
                            </div>
                        </div>
                        <div class="bg-gradient-warning shadow-warning border-radius-lg pt-4 pb-3">
                            <h6 class="text-white text-capitalize ps-3">Video table</h6>
                        </div>
                    </div>
                    <div class="card-body px-0 pb-2">
                        <div class="table-responsive p-0">
                            <asp:GridView ID="GridView1" runat="server" class="table align-items-center mb-0" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="222px" DataKeyNames="id">
                                <Columns>
                                    <asp:BoundField DataField="video_name" HeaderText="video_name" SortExpression="video_name" />
                                    <asp:BoundField DataField="lab_link" HeaderText="lab_link" SortExpression="lab_link" />
                                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                                    <asp:TemplateField HeaderText="Actions">
                                        <ItemTemplate>
                                            <asp:Button ID="btnDelete" OnClick="btnDelete_Click" runat="server" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this record?');" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Grit_Management_DBConnectionString %>" SelectCommand="SELECT [video_name], [lab_link], [id] FROM [videos]"></asp:SqlDataSource>
                        </div>
                        <%--end of table--%>
                    </div>
                </div>
            </div>
        </form>
    </div>
</asp:Content>
