class Api::V1::InterviewsController < ApplicationController
    def index
        @interviews = Interview.all
    end
    def show
        @interview = Interview.find(params[:id])
    end
    def create
    
    end
    
    def update
    
    end
    
    def destroy
    
    end
end