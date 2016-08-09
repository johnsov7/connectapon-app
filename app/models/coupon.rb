class Coupon < ActiveRecord::Base
  belongs_to :tenant
  validates_uniqueness_of :title
  validate :free_plan_can_only_have_one_coupon
  
   def free_plan_can_only_have_one_coupon
     if self.new_record? && (tenant.coupons.count > 0) && (tenant.plan == 'free')
       errors.add(:base, "Free plans can not have more than one coupon")
     end   
   end
   
   def self.by_plan_and_tenant(tenant_id)
     tenant = Tenant.find(tenant_id)
     if tenant.plan == 'premium'
       tenant.coupons
     else
       tenant.coupons.order(:id).limit(1)
     end   
   end
end
