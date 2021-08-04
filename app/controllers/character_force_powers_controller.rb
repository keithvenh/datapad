class CharacterForcePowersController < ApplicationController

    def new
        @character = find_character
        @force_powers = ForcePower.all.order(:name)
        @character_force_power = CharacterForcePower.new
    end
    
    def create
        @character = find_character
        @character_force_power = CharacterForcePower.new(character_force_power_params)
    if @character_force_power.save!
        flash[:notice] = "You have successfully added #{@character_force_power.force_power.name} to #{@character.name}"
        # add_character_specialization_talents(@character, @character_specialization.specialization)
        redirect_to character_path(@character)
    else
        flash.now[:alert] = "Beep Boop. Something went wrong."
        render 'new'
    end
    end
    
    #   def show
    #     @character = find_character
    #     @character_specialization = CharacterSpecialization.find(params[:id])
    #   end
    
    def edit
        @character = find_character
        @character_force_power = CharacterForcePower.find(params[:id])
        @force_powers = ForcePower.all.order(:name)
    end
    
    def update
        @character = find_character
        @character_force_power = CharacterForcePower.find(params[:id])
        if @character_force_power.update(character_force_power_params)
            flash[:notice] = "You have successfully updated #{@character_force_power.force_power.name} for #{@character.name}."
            redirect_to character_path(@character)
        else
            flash.now[:alert] = "Beep Boop. Something went wrong."
            render 'edit'
        end
    end
    
    def destroy
        @character = find_character
        @character_force_power = CharacterForcePower.find(params[:id])
        flash[:notice] = "You have successfully deleted #{@character_force_power.force_power.name} from #{@character.name}."
        @character_force_power.destroy
            
        redirect_to character_path(@character)
    end
      
      private
      
        def character_force_power_params
          params.require(:character_force_power).permit(:character_id, :force_power_id)
        end
    
        def find_character
          Character.find(params[:character_id])
        end
    
    #     def add_character_specialization_talents(character, specialization)
    
    #       specialization.specialization_talents.each do |spec_talent|
    
    #         CharacterSpecTalent.create!(
    #           character: character,
    #           specialization_talent: spec_talent,
    #           purchased: false
    #         )
    
    #       end
    
    #     end
end
