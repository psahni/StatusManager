module OidGenerator
	extend ActiveSupport::Concern
	OID_LIMIT = 12
	
	included do
		before_create :set_oid
	end

protected

	def set_oid
		self.oid = SecureRandom.hex(OID_LIMIT) 			
	end

end
