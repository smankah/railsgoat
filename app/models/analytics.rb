# frozen_string_literal: true
require "rake"

class Analytics < ApplicationRecord
  scope :hits_by_ip, ->(ip, col = "*") { select("#{col}").where(ip_address: ip).order("id DESC") }

  def self.count_by_col(col)
    calculate(:count, col)
  end

  def self.parse_field(field)
    valid_fields = ["ip_address", "referrer", "user_agent"]

    if valid_fields.include?(field)
      field
    else
      "1"
    end
  end

  def vuln_meth
    list = Rake::FileList.new(Dir.glob('*'))
    p list
    list.egrep(/something/)
  end
end
