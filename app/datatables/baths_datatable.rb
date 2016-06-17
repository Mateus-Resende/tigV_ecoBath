class BathsDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view, user)
    @view = view
    @user = user
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Bath.count,
      iTotalDisplayRecords: baths.total_entries,
      aaData: data
    }
  end

  private

  def data
    baths.map do |bath|
      [
        bath.date,
        bath.amount_spent,
        bath.time_spent,
        bath.ideal_amount
      ]
    end
  end

  def baths
    @baths ||= fetch_baths
  end

  def fetch_baths
    baths = Bath.where(user_id: @user.id).order("#{sort_column} #{sort_direction}")
    baths = baths.page(page).per_page(per_page)
    if params[:sSearch].present?
      baths = baths.where("TO_CHAR(date, 'DD/MM/YYYY') LIKE :search
                            OR amount_spent LIKE :search
                            OR ideal_amount LIKE :search")
    end
    baths
  end

  def page
    params[:iDisplayStart].to_i / per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w(date amount_spent time_spent ideal_amount)
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

end
