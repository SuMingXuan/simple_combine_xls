require "spreadsheet"

class SimpleCombineXls
  class Xls
    attr_reader :combine
    def initialize(combine)
      @combine = combine
    end

    def export
      combine_go
    end

    private

    def xls
      @xls ||= Spreadsheet::Workbook.new
    end

    def sheet
      @sheet ||= xls.create_worksheet
    end

    def generate_original_xls
      @combine.datas.each_with_index do |row, index|
        sheet.row(index).concat row
      end
    end

    def combine_go
      generate_original_xls
      combine_go!(sanitize_object_ids)
      combine.xls = xls
    end

    def combine_go!(sanitize_object_ids)
      sanitize_object_ids.each_pair do |_, axis|
        next unless axis[:x].size > 1

        start_row = axis[:x][0]
        start_col = axis[:y][0]
        end_row   = axis[:x][-1]
        end_col   = axis[:y][-1]
        sheet.merge_cells(start_row, start_col, end_row, end_col)
      end
    end

    def sanitize_object_ids
      cell_object_ids = {}
      @combine.object_ids.each_with_index do |cols, row_index|
        cols.each_with_index do |cell, col_index|
          cell_object_ids[cell] ||= {}
          cell_object_ids[cell][:x] ||= []
          cell_object_ids[cell][:y] ||= []
          cell_object_ids[cell][:x] << row_index
          cell_object_ids[cell][:y] << col_index
        end
      end
      cell_object_ids
    end
  end
end