# understands the printing of items
class Printer

  def self.print_statement(statement)
    puts "date || credit || debit || balance"
    statement.each { | item | puts "#{item[:date]} || #{item[:credit]} || #{item[:debit]} || #{item[:balance]}" }
  end

end
