class PipelinesController < ApplicationController
    def index
        @pipelines = current_user.pipelines.all
    end
    def show
        get_pipeline
    end
    def new
        @pipeline = Pipeline.new
    end
    def create
        @pipeline = Pipeline.new(pipeline_params)
        setup_pipeline @pipeline
        if @pipeline.save
            redirect_to @pipeline
        else
            render 'new'
        end
    end
    def edit
        get_pipeline
    end
    def update
        get_pipeline
        if @pipeline.update(pipeline_params)
            redirect_to pipelines_url
        else
            render 'edit'
        end
    end
    def destroy
        get_pipeline
        @pipeline.destroy
        redirect_to pipelines_url
    end
    def add_pipeline_contact
        get_pipeline
    end

private
    def setup_pipeline(target)
        target.user = current_user
    end
    def get_pipeline
        @pipeline = Pipeline.find_by(id: params[:id])
    end
    def pipeline_params
        params.require(:pipeline).permit(:title, contact_ids:[])
    end
end
