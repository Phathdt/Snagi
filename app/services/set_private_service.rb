class SetPrivateService
	def initialize(params)
		@type = params[:type]
		@id = params[:id]
	end
	# check private and set toggle
	def set_private
		if @type == 'Album'
			Album.find(@id).is_private ? private_off : private_on 
		else
			Picture.find(@id).is_private ? private_off : private_on 
		end
	end

	private

	def private_on
		@type == 'Album' ? Album.find(@id).update(is_private:true) : Picture.find(@id).update(is_private:true)
	end

	def private_off
		@type == 'Album' ? Album.find(@id).update(is_private:false) : Picture.find(@id).update(is_private:false)
	end
end