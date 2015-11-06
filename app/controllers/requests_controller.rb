class RequestsController < ApplicationController
	def index
		@requests = Request.paginate(page: params[:page])
	end

	def parse_json
		@request = Request.new request_params

		if @request.save
			respond_to do |format|
				format.html
				format.json { render json: @request, status: :ok }
			end
		end
	end

	def show
		@request = Request.find params[:id]
	end

	private
		def request_params
			params[:request_number] = params[:RequestNumber]
			params[:sequence_number] = params[:SequenceNumber]
			params[:request_type] = params[:RequestType]
			params[:service_area_primary_service_area_code] = params[:ServiceArea][:PrimaryServiceAreaCode]
			params[:service_area_additional_service_area_codes] = params[:ServiceArea][:AdditionalServiceAreaCodes]
			params[:excavator_company_name] = params[:Excavator][:CompanyName]
			params[:excavator_address] = params[:Excavator][:Address]
			params[:digsite_info_well_known_text] = params[:ExcavationInfo][:DigsiteInfo][:WellKnownText]
			params.permit(
				:request_number,
				:sequence_number,
				:request_type,
				:service_area_primary_service_area_code,
				:service_area_additional_service_area_codes,
				:excavator_company_name,
				:excavator_address,
				:digsite_info_well_known_text
			)
		end
end
