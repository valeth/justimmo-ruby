require 'justimmo/mapper'

module Justimmo
  module RealtyMapper
    extend Justimmo::Mapper

    @mapping = {
      nutzungsart:                        :usage,
      wohnung:                            :apartment,
      user_defined_simplefield:           :user_defined_simplefield,
      preis:                              :price,
      erstes_bild:                        :first_image,
      zweites_bild:                       :second_image,
      zinshaus_renditeobjekt:             :yield_realty,
      user_defined_anyfield:              :user_defined_anyfield,
      ji_kategorie:                       :ji_kategorie,
      verkaufsflaeche:                    :sales_area,
      haus:                               :house,
      geo:                                :geo,
      wohnen:                             :living,
      gewerbe:                            :business,
      anlage:                             :investment,
      kauf:                               :purcase,
      miete_pacht:                        :rent,
      feldname:                           :field_name,
      wohnungtyp:                         :apartment_type,
      zins_typ:                           :interest_type,
      haustyp:                            :house_type,

      id:                                 :id,
      objektnummer:                       :property_number,
      titel:                              :title,
      objekttitel:                        :title,
      dreizeiler:                         :teaser,
      naehe:                              :proximity,
      objektbeschreibung:                 :description,
      sonstige_angaben:                   :other_information,
      etage:                              :tier,
      tuernummer:                         :door_number,
      plz:                                :zip_code,
      ort:                                :place,
      kaufpreis:                          :purcase_price,
      kaufpreisnetto:                     :purcase_price_net,
      kaufpreis_ust:                      :purcase_price_vat, # ?
      gesamtmiete:                        :total_rent,
      kaufpreis_pro_qm:                   :purcase_price_per_sqm,
      mietpreis_pro_qm_von:               :rent_per_sqm_from, # ?
      mietpreis_pro_qm:                   :rent_per_sqm,
      teilbar_ab:                         :floor_area_from,
      nutzflaeche:                        :floor_area,
      grundflaeche:                       :surface_area,
      wohnflaeche:                        :living_area,
      gesamtflaeche:                      :total_area,
      projekt_id:                         :project_id,
      status:                             :status,
      status_id:                          :status_id,
      bewohnt:                            :occupancy, # ?
      vermarktungsart:                    :marketing_type,
      objektart:                          :realty_type,
      objektart_id:                       :realty_type_id,
      objektart_name:                     :realty_type_name,
      sub_objektart:                      :sub_realty_type, # ?
      sub_objektart_id:                   :sub_realty_type_id,
      sub_objektart_name:                 :sub_realty_type_name,
      ausstattung_beschreibung:           :equipment_description, # ?
      geokoordinaten_breitengrad:         :latitude, # ?
      geokoordinaten_laengengrad:         :longitude,  # ?
      geokoordinaten_breitengrad_exakt:   :latitude_precise,
      geokoordinaten_laengengrad_exakt:   :longitude_precise,
      ausrichtung:                        :orientation,
      strasse:                            :street,
      hausnummer:                         :house_number,
      bundesland:                         :federal_state,
      land:                               :country,
      flur:                               :hallway,
      flurstueck:                         :land_parcel,
      gemarkung:                          :district,
      regionaler_zusatz:                  :regional_addition,
      nettokaltmiete:                     :net_rent,
      nebenkosten:                        :additional_charges,
      heizkosten:                         :heating_costs,
      waehrung:                           :currency, # ?
      kaution:                            :surety,
      kaution_text:                       :surety_text,
      abstand:                            :compensation,
      wohnbaufoerderung:                  :build_subsidies,
      rendite:                            :yield,
      nettoertrag_monatlich:              :net_earning_monthly,
      nettoertrag_jaehrlich:              :net_earning_yearly,
      gesamtmiete_ust:                    :total_rent_vat,
      zusatzkosten:                       :additional_costs,  # ?
      grunderwerbssteuer:                 :transfer_tax,
      grundbucheintragung:                :land_registration,
      anhaenge:                           :attachments, # ?
      baujahr:                            :year_built,  # ?
      alter:                              :age, # ?
      infrastruktur_provision:            :infrastructure_provision, # ?
      zustand:                            :condition, # ?
      ausstattung:                        :equipment, # ?
      anzahl_zimmer:                      :room_count,
      anzahl_badezimmer:                  :bathroom_count,
      anzahl_sep_wc:                      :toilet_room_count,
      anzahl_balkon_terrassen:            :balcony_terrace_count,
      balkon_terrasse_flaeche:            :balcony_terrace_area,
      anzahl_balkone:                     :balcony_count,
      anzahl_balkons:                     :balcony_count,
      anzahl_terrassen:                   :terrace_count,
      gartenflaeche:                      :garden_area,
      kellerflaeche:                      :cellar_area,
      bueroflaeche:                       :office_area,
      lagerflaeche:                       :storage_area,
      anzahl_loggias:                     :loggia_count,
      loggias_flaeche:                    :loggia_area,
      balkons_flaeche:                    :balcony_area,
      terrassen_flaeche:                  :terrace_area,
      anzahl_garagen:                     :garage_count,
      garagen_flaeche:                    :garage_area,
      anzahl_stellplaetze:                :parking_count,
      stellplatz_flaeche:                 :parking_area,
      anzahl_abstellraum:                 :store_room_count,
      vertragerrichtungsgebuehr:          :contract_establishment_costs,
      aussen_courtage:                    :commission,
      lage:                               :locality,
      objektkategorie:                    :categories, # ?
      verfuegbar_von:                     :available_from, # ?
      mietdauer:                          :rent_duration, # ?
      art_mietdauer:                      :rent_duration_type, # ?
      verbaubare_flaeche:                 :buildable_area,
      energiepass:                        :energy_pass, # ?
      kontaktperson:                      :contact, # ?
      justimmo_freitext1:                 :freetext1,
      justimmo_freitext2:                 :freetext2,
      justimmo_freitext3:                 :freetext3,
      freitext_preis:                     :cost_explanation,
      bauart_id:                          :style_of_building_id,
      vermittelt_am:                      :procured_at,
      erstellt_am:                        :created_at,
      aktualisiert_am:                    :updated_at,
      stiege:                             :stair,
      realty_system_type:                 :realty_system_type,
      parent_id:                          :parent_id,
      ji_anzeige_in_suchergebnis:         :show_in_search,
      miete_ust:                          :rent_vat, # ?
      art_miete_ust:                      :rent_vat_type, # ?
      bruttowert_miete:                   :rent_gross, # ?
      miete_ust_wert:                     :rent_vat_value, # ?
      miete_ust_eingabe:                  :rent_vat_input, # ?
      ji_is_reference:                    :is_reference,

      betriebskosten_pro_qm:              :operation_cost_per_sqm, # ?
      anzahl_etagen:                      :tier_count, # ?
      epass_hwbwert:                      :thermal_heat_requirement_value, # ?
      epass_hwbklasse:                    :thermal_heat_requirement_class, # ?
      epass_fgeewert:                     :energy_efficiency_factor_value, # ?
      epass_fgeeklasse:                   :energy_efficiency_factor_class, # ?
    }.freeze

    @params_mapping = {
      limit:       :Limit,
      offset:      :Offset,
      language:    :culture,
      orderby:     :orderby,
      order:       :ordertype,
      picturesize: :picturesize,
      all:         :alleProjektObjekte,
      realty_id:   :objekt_id
    }.freeze

    @filter_mapping = {
      price:                :preis,
      realty_type_id:       :objektart_id,
      sub_realty_type_id:   :subobjektart_id,
      style_of_building_id: :bauart_id,
      realty_category:      :tag_name,
      tag:                  :tag_name,
      zip_code:             :plz,
      rooms:                :zimmer,
      property_number:      :objektnummer,
      area:                 :sort_flaeche,
      living_area:          :wohnflaeche,
      floor_area:           :nutzflaeche,
      surface_area:         :grundflaeche,
      keyword:              :stichwort,
      federal_state_id:     :bundesland_id,
      status_id:            :objekt_status_id,
      rent:                 :miete,
      buy:                  :kauf,
      realty_system_type:   :realty_type,
      parent_id:            :parent_id,
      rent_per_sqm:         :price_per_m2,
      created_at:           :created_at,
      updated_at:           :aktualisiert_am
    }.freeze
  end
end
