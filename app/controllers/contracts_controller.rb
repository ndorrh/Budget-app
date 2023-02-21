class ContractsController < ApplicationController
  before_action :set_contract, only: %i[ show edit update destroy ]

  # GET /contracts or /contracts.json
  def index
    @contracts = Contract.all
  end

  # GET /contracts/1 or /contracts/1.json
  def show
  end

  # GET /contracts/new
  def new
    @contract = Contract.new
  end

  # GET /contracts/1/edit
  def edit
  end

  # POST /contracts or /contracts.json
  def create
    @contract = Contract.new(contract_params.except(:groups))   
    @contract.author = current_user

    if params[:contract][:groups].length <= 1 
      flash.alert = "Select atleast one checkbox"
      redirect_to new_contract_path and return
    end
    
    respond_to do |format| 
      if @contract.save && create_or_delete_contracts_groups(@contract, params[:contract][:groups]) 
        format.html { redirect_to group_url(params[:contract][:groups][1]), notice: "Contract was successfully created." }
        format.json { render :show, status: :created, location: @contract }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contracts/1 or /contracts/1.json
  def update
    respond_to do |format|
      if @contract.update(contract_params.except(:groups)) && create_or_delete_contracts_groups(@contract, params[:contract][:groups])
        format.html { redirect_to group_url(params[:contract][:groups][1]), notice: "Contract was successfully updated." }
        format.json { render :show, status: :ok, location: @contract }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1 or /contracts/1.json
  def destroy
    @contract.destroy

    respond_to do |format|
      format.html { redirect_to contracts_url, notice: "Contract was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def create_or_delete_contracts_groups(contract, groups)
      contract.contract_groups.destroy_all
      groups.each do |group|
        ContractGroup.create(contract:contract, group: Group.find(group)) if group != ""
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_contract
      @contract = Contract.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def contract_params
      params.require(:contract).permit(:name, :amount, :groups => [])
    end
end
