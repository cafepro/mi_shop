module Spree
  class Asociate < Spree::Base

    def self.import_from_file file_path='./db/imports/libro_de_socios.xlsx'
      require 'roo'
      xlsx = Roo::Spreadsheet.open("./#{file_path}", extension: :xlsx)
      asociate = nil
      number = nil
      xlsx.each_row_streaming(offset: 1) do |row|
        if row[3].value.blank?
          number = row[2].value
        else
          asociate = nil if !asociate.nil? && asociate.asociate_identifier != number.to_i
          last_one = new_asociate_from_file_row(row, number, asociate)
          asociate = last_one if asociate.nil?
        end
      end
    rescue => e
      Rails.logger.fatal e
      byebug
    end

    private

    # 1 Vrf
    # 3 Nº SOCIO
    # 4 ZITRON
    # 4 VINCULACION
    # 5 FECHA DE ALTA
    # 6 FECHA BAJA
    # 7 SEPA
    # 8 S. MEDICO
    # 9 MODALIDAD
    # 10 PARENTESCO
    # 11 NOMBRE
    # 12 APELLIDO 1
    # 13 APELLIDO 2
    # 14 DOC.
    # 15 NÚMERO NIF
    # 16 SEXO
    # 17 F. NACIMIENTO
    # 18 EDAD
    # 19 TIPO VÍA
    # 20 DIRECCIÓN
    # 21 Nº
    # 22 RESTO
    # 23 PROVINCIA
    # 24 POBLACIÓN
    # 25 C.P.
    # 26 TELÉFONO
    # 27 E-MAIL
    # 28 IBAN
    # 29 BANCO
    # 30 SUCURSAL
    # 31 DC
    # 32 CUENTA
    # 33 INSCRIPCION 2018

    def self.new_asociate_from_file_row row, number, linked_asociate
      Spree::Asociate.create(
                              asociate_identifier: number,
                              asociate_code: row[3].value.gsub(number.to_s, ''),
                              zitron: row[4].value,
                              link_to_asociate: (linked_asociate.id rescue nil),
                              start_date: parse_year(row[6].value),
                              end_date: nil,
                              sepa: false,
                              medical_insurance: (row[9].value == 'S'),
                              modality: row[11].value,
                              insurance_start_date: nil,
                              insurance_end_date: nil,
                              relationship: row[13].value,
                              name: row[14].value,
                              first_surname: row[15].value,
                              second_surname: row[16].value,
                              document_type: (row[17].value || 'NIF'),
                              document_number: row[18].value,
                              sex: row[19].value,
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
      Rails.logger.fatal e
      byebug
    end

    def self.parse_year value
      if value =='ANT 2011'
        return Date.parse('1-1-2010')
      elsif value == 'DESP'
        return nil
      else
        return Date.parse("1-1-#{value}")
      end
    rescue
      nil
    end

  end
end
