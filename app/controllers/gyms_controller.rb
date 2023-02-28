class GymsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_gym_not_found_response

    def index 
        gyms = Gym.all 
        render json: gyms, status: :ok
    end

    def show 
        gym = Gym.find(params[:id])
        render json: gym, status: :ok
    end

    def destroy 
        gym = Gym.find(params[:id])
        gym.destroy! 
        head :no_content
    end

    private

    def render_gym_not_found_response(exception)
        render json: { error: "Gym not found" }, status: :not_found
    end

end
