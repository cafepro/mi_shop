module Spree
  class Asociate < Spree::Base

    # RELATIONSHIPS
    belongs_to :user
    has_many :asociates, foreign_key: :link_to_asociate

    def parent
      Spree::Asociate.find(self.link_to_asociate)
    end

    def family
      # all family/group members
      self.parent.asociates.where.not(id: self.id)
    end

    # CALLBACKS
    before_save :update_complete_name_search

    def destroy
      super and return if !self.deleted_at.blank?
      self.deleted_at = DateTime.now
      self.save
    end

    def update_complete_name_search
      self.complete_name_search = "#{self.complete_name} #{self.complete_name.parameterize.gsub('-',' ')}"
    end

    def identifier_code
      self.asociate_identifier.to_s.rjust(3,'0')+self.asociate_code
    end

    def complete_name
      "#{self.name} #{self.first_surname} #{self.second_surname}".split.map(&:capitalize).join(' ')
    end

    def complete_name_with_email
      "#{complete_name} (#{self.email})"
    end

    def document
      "#{self.document_type} #{self.document_number}"
    end

    ### SELECTS
    def self.sex_options
      ['Hombre','Mujer']
    end

    def self.document_type_options
      ['NIF','CIF','NIE']
    end

    def self.street_type_options
      ["CALLE",
       "AVENIDA",
       "CAMINO",
       "CARRETERA",
       "BARRIO",
       "PUEBLO",
       "CL",
       "PASEO",
       "(LOCALIDAD)",
       "PLAZA",
       "URBANIZACION"]
    end

    def self.relationship_options
      ["TITULAR", "CÓNYUGE", "HIJ@", "PROGENITOR@", "TI@", "HERMAN@", "AMIG@", "Otro"]
    end

    def self.modality_options
      ["HOSPITALARIA", "AMBULATORIA"]
    end

    ### HELPERS
    def age
      if self.birth_date.blank?
        return ''
      else
        return Date.today.year - self.birth_date.year
      end
    end

    # returns the next asociate_identifier in the sequence
    def next_asociate_identifier
      if self.new_record? && self.link_to_asociate.blank?
        # the first of his kind...
        return Spree::Asociate.order(:asociate_identifier).last.asociate_identifier + 1
      else
        return self.parent.asociate_identifier
      end
    end

    def next_asociate_code
      if self.new_record? && self.link_to_asociate.blank?
        # the first of his kind...
        return 'A'
      else
        return self.family.order(:asociate_code).last.asociate_code.next
      end
    end

    ### IMPORTS
    def self.import_from_file file_path='./db/imports/libro_de_socios.xlsx'
      Rails.logger.fatal "---- Comienza la importación -----"
      successful = 0
      @@errors = []
      require 'roo'
      xlsx = Roo::Spreadsheet.open("./#{file_path}", extension: :xlsx)
      asociate = nil
      number = nil
      xlsx.each_row_streaming(offset: 1) do |row|
        if row && row[3] && row[3].value.blank?
          number = row[2].value
          break if number.nil?
        elsif row
          asociate = nil if !asociate.nil? && asociate.asociate_identifier != number.to_i
          last_one = new_asociate_from_file_row(row, number, asociate)
          asociate = last_one if asociate.nil?
          successful += 1
        end
      end
      Rails.logger.fatal "successful = #{successful}"
      Rails.logger.fatal "errors = #{@@errors.inspect}"
      Rails.logger.fatal "---- Comienza la importación -----"
      Rails.logger.fatal "---- Fin de la importación -----"
    rescue => e
      Rails.logger.fatal e
    end

    private

    def self.new_asociate_from_file_row row, number, linked_asociate
      Spree::Asociate.create(
                              asociate_identifier: number,
                              asociate_code: row[3].value.gsub(number.to_s, ''),
                              zitron: row[4].value,
                              link_to_asociate: (linked_asociate.id rescue nil),
                              start_date: parse_year(row[6].value),
                              end_date: nil,
                              sepa: (row[8].value != 0 rescue true),
                              medical_insurance: (row[9].value == 'S'),
                              asociation_type: row[10].value,
                              modality: row[11].value,
                              insurance_start_date: nil,
                              insurance_end_date: nil,
                              relationship: row[13].value,
                              name: row[14].value,
                              first_surname: row[15].value,
                              second_surname: row[16].value,
                              document_type: (row[17].value || 'NIF'),
                              document_number: row[18].value,
                              sex: (row[19].value=='H' ? 'Hombre' : 'Mujer'),
                              birth_date: (Date.parse(row[20].value) rescue nil),
                              street_type: row[22].value,
                              street: row[23].value,
                              number: row[24].value,
                              floor: row[25].value,
                              city: row[27].value,
                              province: row[26].value,
                              postal_code: row[28].value,
                              phone_number: row[29].value,
                              email: row[30].value,
                              iban: row[31].value,
                              bank: row[32].value,
                              bank_office: row[33].value,
                              dc: row[34].value,
                              account: row[35].value,
                              inscription_fee: row[37].value,
                              incription_cuote: row[38].value,
                              deleted_at: nil
                            )
    rescue => e
      @@errors << row[0].value
      Rails.logger.fatal e
    end

    def self.parse_year value
      if ['ANT 2011','ANT2011'].include?(value)
        return Date.parse('1-1-2010')
      elsif value == 'DESP' || value.nil?
        return nil
      else
        date = Date.parse(value) rescue nil
        return date || Date.parse("1-1-#{value}")
      end
    end

  end
end
