require_relative 'filter_builder'

class SpellFilterBuilder < FilterBuilder
  def perform
    if @klass == Spell
      if @params[:search_term]
        @results = Spell.where('name LIKE ? OR description LIKE ?',
          "%#{params[:search_term]}%", "%#{params[:search_term]}%")
      elsif @params[:class_filter] && @params[:level]
        class_name = @params[:class_filter]
        level = @params[:level].to_i
        @results = Spell.where('class_requirements @> ?', { class_name => level }.to_json)
      elsif @params[:class_filter]
        class_name = @params[:class_filter]
        @results = Spell.find_by_sql("SELECT \"spells\".* FROM spells
          WHERE NOT (class_requirements @> '{\"#{class_name}\":null}');")
      end
    end

    @results
  end
end
