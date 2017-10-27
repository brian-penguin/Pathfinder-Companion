class Exporter
  def initialize(foo: bar)
    @foo = foo
  end

  def perform(stuff)
    export(stuff) if can_export?
    @foo
  end

  private

  def export(stuff)
    puts 'true'
  end

  def can_export?
    @foo
  end

  def bar
    true
  end
end
