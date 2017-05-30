class Screenshot < ApplicationRecord
  belongs_to :domain
  mount_uploader :filename, ImageUploader

  scope :created_desc, -> { order(created_at: "DESC") }
  scope :created_selected_date, lambda { |selected_date| where("created_at::date = ?", selected_date)}

  def self.search(search_params)
    if search_params[:screenshot].present?
      selected_date = search_params[:screenshot][:date] || nil
      domains = search_params[:screenshot][:domain_names]
      if search_params[:screenshot][:date].present?
        if !search_params[:screenshot][:domain_names].nil?
          qry = Screenshot.created_selected_date(selected_date).created_desc.where({domain_id: domains}).limit(domains.length).reverse
        else
          qry = Screenshot.created_selected_date(selected_date).created_desc.limit(Domain.count).reverse
        end
      end
    else
      qry = []
      doms = Domain.all
      doms.each do |d|
        qry += Screenshot.created_desc.where({domain_id: d.id}).limit(1)
      end
      @screenshots = qry
    end
  end
end
