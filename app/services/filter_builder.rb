# ActiveRecord Query for all spells of a class
# Spell.find_by_sql("SELECT \"spells\".* FROM spells WHERE NOT (class_requirements @> '{\"paladin\":null}');")
# raw SQL: SELECT "spells".* FROM spells WHERE NOT (class_requirements @> '{"paladin":null}');

# This query is to find all spells of a specific class level, i.e. 3rd level wizard spells
# Spell.where('class_requirements @> ?', {'wizard' => 3}.to_json)

class FilterBuilder
  attr_accessor :klass, :params, :results

  def initialize(object_type, params)
    @klass = object_type[:klass]
    @params = params
    @results = nil
  end
end

# def perform
#   if @klass == Spell
#     if @params[:class_filter] && @params[:level]
#       class_name = @params[:class_filter]
#       level = @params[:level].to_i
#       @results = Spell.where('class_requirements @> ?', {class_name => level}.to_json)
#     elsif @params[:class_filter]
#       class_name = @params[:class_filter]
#       @results = Spell.find_by_sql("SELECT \"spells\".* FROM spells WHERE NOT (class_requirements @> '{\"#{class_name}\":null}');")
#     end
#   end
#
#   return @results
# end
