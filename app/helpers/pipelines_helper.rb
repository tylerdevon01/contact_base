module PipelinesHelper
    def contacts_with(label)
        pipeline = Pipeline.find_by(id:params[:id])
        contacts = pipeline.contacts

        return contacts.where(label: label).all
    end
end
