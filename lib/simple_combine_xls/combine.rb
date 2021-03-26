class SimpleCombineXls
  attr_reader :datas, :object_ids, :placeholder
  attr_accessor :xls
  def initialize(datas, placeholder: nil)
    validate_arguments!(datas)
    @placeholder = placeholder || Config.placeholder
    @datas       = datas
    @object_ids  = extract_object_ids
  end

  def drawing(type: "xls")
    case type
    when "xls" then Xls.new(self).export
    end
  end

  private

  def extract_object_ids
    datas.map do |row|
      row.map do |cell|
        # 保证每个 placeholder 生成的 object_id 不同
        cell = placeholder.dup if cell.nil? || cell.empty?
        cell.to_s.object_id
      end
    end
  end

  def validate_arguments!(datas)
    begin
      datas[0][0]
    rescue
      raise ArgumentError, "datas must be two dimensional array"
    end
  end
end