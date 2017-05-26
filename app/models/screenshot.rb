class Screenshot < ApplicationRecord
  belongs_to :domain
  mount_uploader :filename, ImageUploader

  scope :created_desc, -> { order(created_at: "DESC") }
  scope :created_begin_today, -> { where("created_at::date = ?", Date.today) }
  scope :created_selected_date, lambda { |selected_date| where("created_at::date = ?", selected_date)}
  scope :search_for_domains, lambda { |domain1, domain2| where(domain_id: domain1).or(where(domain_id: domain2))}
  scope :by_user, lambda { |user_id| joins(:users, :company_users).where("companies_users.user_id = ?", user_id) }
  scope :default_domains, -> { where("domain_id = 1").or(where("domain_id = 2")) }

  def self.search(search_params)

    if search_params[:screenshot].present?

      selected_date = search_params[:screenshot][:date] || nil

      domains = search_params[:screenshot][:domain_names]
    

      if search_params[:screenshot][:date].present?

        if !search_params[:screenshot][:domain_names].nil?

          qry = Screenshot
          qry = qry.created_selected_date(selected_date)
          qry = qry.created_desc
          qry = qry.where({domain_id: domains}).limit(domains.length)
          qry = qry.reverse
        else

          qry = Screenshot
          qry = qry.created_selected_date(selected_date)
          qry = qry.created_desc.limit(Domain.count)
          qry = qry.reverse
        end

      end


    else

      qry = Screenshot.created_begin_today.created_desc.limit(Domain.count)
      @screenshots = qry
      @screenshots = @screenshots.reorder(domain_id: "ASC")

    end


  end


end
