module TenantsHelper
  def select_tenant_type(selected='')
    select_tag('tenant_type', options_for_select([['', '']] + Tenant::TENANTSTYPE, selected),
     id: :tenant_type_select, class: 'selectpicker', data: {value: selected})
  end
end
