json.extract! coupon, :id, :title, :details, :tenant_id, :created_at, :updated_at
json.url coupon_url(coupon, format: :json)