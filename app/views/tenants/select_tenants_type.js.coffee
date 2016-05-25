source = ''
<% if @tenant_type == '0' %>
source = '<%=j render('student_tenant') %>'
<% elsif @tenant_type == '1' %>
source = '<%=j render('workman_tenant') %>'
<% elsif @tenant_type == '2' %>
source = '<%=j render('guest_tenant') %>'
<% elsif @tenant_type == '3' %>
source = '<%=j render('relative_tenant') %>'
<% end %>

$('#tenant_type_fields').html(source)
