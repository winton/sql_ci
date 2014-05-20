require 'pp'

module CiHelper

  def anchor(value)
    value.gsub(/\W/, '')
  end

  def diff(data, index)
    
    new_data = data[index]
    old_data = data[index+1]

    if old_data
      new_data = new_data[1].collect { |h| h['explains'] }
      old_data = old_data[1].collect { |h| h['explains'] }

      new_explains = explains_to_s(new_data)
      old_explains = explains_to_s(old_data)

      new_explains = new_explains.gsub("[{", "[{\n   ")
      old_explains = old_explains.gsub("[{", "[{\n   ")

      Diffy::Diff.new(old_explains, new_explains).to_s(:html)
    else
      nil
    end
  end

  def explains_to_s(array)
    array.map { |e|
      e.map { |h| h.sort.to_h }
    }.pretty_inspect
  end
end
