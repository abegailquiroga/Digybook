<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reservation.aspx.cs" Inherits="YEARBOOK.Reservation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MONITOR CONFLICT</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        body {
            background-color: #f0f0f0; /* Light background color */
        }

        h1, h2 {
            color: #800000; /* Maroon */
        }

        .form-group {
            color: #000080; /* Navy */
        }

        .btn-primary {
            background-color: #ffdb58; /* Mustard */
            border-color: #ffdb58; /* Mustard */
            color: #800000; /* Maroon */
        }

        .btn-primary:hover {
            background-color: #ffd700; /* Gold */
            border-color: #ffd700; /* Gold */
            color: #800000; /* Maroon */
        }

        .table th, .table td {
            border-color: #800000; /* Maroon */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <div>
            <h1>Reservations</h1>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" CssClass="table table-striped">
                <Columns>
                    <asp:BoundField DataField="User" HeaderText="User" SortExpression="User" />
                    <asp:BoundField DataField="StartTime" HeaderText="Start Time" SortExpression="StartTime" />
                    <asp:BoundField DataField="EndTime" HeaderText="End Time" SortExpression="EndTime" />
                </Columns>
            </asp:GridView>

            <div class="mt-4">
                <h2>Make Reservation</h2>
                <div class="form-group">
                    <asp:TextBox ID="txtUser" runat="server" CssClass="form-control" placeholder="User" required></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtStartTime" runat="server" CssClass="form-control" TextMode="DateTimeLocal" placeholder="Start Time" required></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtEndTime" runat="server" CssClass="form-control" TextMode="DateTimeLocal" placeholder="End Time" required></asp:TextBox>
                </div>
                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </form>

    <!-- Bootstrap JS and Popper.js scripts -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzYUEk/I9t2qaqDsKPCPm0Uk5c7Mz2YfoRSJo9g0vhj8S/6D
    code>
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIElC4y4DIIiBl9SQQ8S+H/i+XIKqF"
    code>
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIElC4y4DIIiBl9SQQ8S+H/i+XIKqF"
    code>
    </script>
</body>
</html>
