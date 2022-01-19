module V1
  class KindsController < ApplicationController
    include ErrorSerializer

    before_action :set_kind, only: [:show, :update, :destroy]

    # GET /kinds
    def index
      @kinds = Kind.all

      render json: @kinds
    end

    # GET /kinds/1
    def show
      render json: @kind
    end

    # POST /kinds
    def create
      @kind = Kind.new(kind_params)

      if @kind.save
        render json: @kind, status: :created, location: @kind
      else
        render json: ErrorSerializer.serialize(@kind.errors), status: :unprocessable_entity
      end
    end

    # PATCH/PUT /kinds/1
    def update
      if @kind.update(kind_params)
        render json: @kind
      else
        render json: ErrorSerializer.serialize(@kind.errors), status: :unprocessable_entity
      end
    end

    # DELETE /kinds/1
    def destroy
      @kind.destroy
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_kind
      if params[:contact_id]
        @kind = Contact.find(params[:contact_id]).kind
        return @kind
      end

      @kind = Kind.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def kind_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
  end
end
