json.array!(@tenants) do |tenant|
  json.extract! tenant, :id, :security, :phone, :arrivaldate, :checkout, :note, :resident_id, :resident_type
  json.url tenant_url(tenant, format: :json)
end
