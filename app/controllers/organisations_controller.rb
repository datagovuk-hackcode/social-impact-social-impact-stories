class OrganisationsController < ApplicationController

  before_action :set_organisation, only: [:show, :edit, :update, :destroy]

  private

    def set_organisation
      @organisation = Organisation.find_by_if(params[:id])
    end

    def story_params
      params.require(:organisation).permit(
        :name,
        :address_line_1,
        :address_line_2,
        :address_line_3,
        :postcode,
        :county_state,
        :country,
        :website,
        :phone_number,
        :email,
        :mission_statement
      )
    end




end