class OrganisationsController < ApplicationController

  before_action :set_organisation, only: [:show, :edit, :update, :destroy]

  def index
    @organisations = Organisation.all
  end

  def update
    respond_to do |format|
      if @organisation.update(organisation_params)
        format.html { redirect_to organisation_url(@organisation), notice: 'Organisation was successfully updated.' }
        format.json { render json: @organisation }
      else
        format.html { render action: 'edit' }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  def stories

    @organisation = Organisation.find(params[:organisation_id])
    @stories = Story.where(organisation_id: params[:organisation_id])

  end

  private

    def set_organisation
      @organisation = Organisation.find_by_id(params[:id])
    end

    def organisation_params
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
        :mission_statement,
        :organisation_type_id
      )
    end

end